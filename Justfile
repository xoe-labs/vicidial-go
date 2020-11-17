# Justfile: run recipes with `just`, see: https://github.com/casey/just

@generate:
	just _generate-authors
	just _generate-shoulders
	mkdir -p .tmp
	echo 'foo@bar:~$$ vicigo event-router' > .tmp/usage.txt
	# vicigo event-router 2>&1 >> .tmp/usage.txt
	echo -e "\n\n" >> .tmp/usage.txt
	echo 'foo@bar:~$$ vicigo adaptive-dialer' >> .tmp/usage.txt
	# vicigo adaptive-dialer 2>&1 >> .tmp/usage.txt
	embedmd -w README.md
	rm -rf .tmp

#
# Go recipes
#

go-bin := 				"go"
go-mod-dirs := 			"$(fd go.mod | xargs -n1 -I{} dirname {} | sort -u)"
go-coverage-file := 	"./coverage.txt"
go-ci-test-json := 		"./go-test.json"
go-ci-build-log := 		"./go-build.log"
go-ci-install-log := 	"./go-install.log"

go-install:
	# @rm -f /tmp/goinstall.log
	# @{{go-bin}} install -v . 2>&1 | tee $(GOINSTALLLOG_FILE)
	@{{go-bin}} install $(GO_INSTALL_OPTS) .

go-release:
	goreleaser --snapshot --skip-publish --rm-dist
	@echo -n "Do you want to release? [y/N] " && read ans &&  if [ $${ans:-N} = y ]; then set -xe; goreleaser --rm-dist; fi

go-unittest:
	@echo "mode: atomic" > /tmp/gocoverage
	just _go-foreach-go-mod-dir {{go-bin}} 	test ./... $(GO_TEST_OPTS) -cover -coverprofile=/tmp/profile.out -covermode=atomic -race $([ ! -z $CI ] && echo "-json")
	@[ -f /tmp/profile.out ] && cat /tmp/profile.out | sed "/mode: atomic/d" >> /tmp/gocoverage;  rm -f /tmp/profile.out
	@mv /tmp/gocoverage $(GOCOVERAGE_FILE)

go-checkdoc:
	go doc ./go.mod

go-coverfunc: go-unittest
	go tool cover -func=$(GOCOVERAGE_FILE) | rg -v -e '.pb.go:' -e '.pb.gw.go:' -e '.sql.go:'

go-lint:
	just _go-foreach-go-mod-dir {{go-bin}} 	golangci-lint run --verbose ./...

go-tidy:
	just _go-foreach-go-mod-dir {{go-bin}} 	mod tidy

go-depaware-update: go-tidy
	depaware --update ./cmd/vicigo

go-depaware-check: go-tidy
	depaware --check ./cmd/vicigo

go-build:
	just _go-foreach-go-mod-dir {{go-bin}} 	build ./...

go-bumpdeps:
	just _go-foreach-go-mod-dir {{go-bin}} 	get -u ./...

go-fmt:
	just _go-foreach-go-mod-dir {{go-bin}} 	run golang.org/x/tools/cmd/goimports -w $(go list -f '{{"{{"}}.Dir{{"}}"}}' ./...)

_go-foreach-go-mod-dir +cmd:
	#! /usr/bin/env bash
	for dir in {{go-mod-dirs}}; do
	  cd "$dir"; {{cmd}}
	done


#
# Image recipes
#

image-name := 			"blaggacao/vicidial-go"

image-build:
	docker build \
	  --build-arg VCS_REF=`git rev-parse --short HEAD` \
	  --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
	  --build-arg VERSION=`git describe --tags --always` \
	  -t {{image-name}} -f ./build/package/Dockerfile .


#
# Markdown linting
#

md-testfiles := "$(fd .md)"

# check markdown files
md-lint:
	@echo ""
	@echo "==> Files to check:"
	@echo "  {{md-testfiles}}"
	just md-offensive-wording
	just md-spellcheck
	just md-format
	just md-markdownlint
	@echo ""
	@echo "--- OK. ---"

# check for inconsiderate/insensitive wording
md-offensive-wording:
	@alex --diff {{md-testfiles}} || true

# check for spelling errors
md-spellcheck:
	@mdspell --target-relative --report --en-us --ignore-numbers --ignore-acronyms {{md-testfiles}}

# check for messy formatting
md-format:
	@remark -r ./devshell/configs/remark.json --frail {{md-testfiles}}

# check for good practices
md-markdownlint:
	@markdownlint -c ./devshell/configs/markdownlint.json {{md-testfiles}}

#
# General repo automation
#

_linguist-kept:
	@git check-attr linguist-vendored $(git check-attr linguist-generated $(find . -type f | grep -v .git/) | grep unspecified | cut -d: -f1) | grep unspecified | cut -d: -f1 | sort

_linguist-ignored:
	@git check-attr linguist-vendored linguist-ignored `find . -not -path './.git/*' -type f` | grep '\ set$$' | cut -d: -f1 | sort -u

_generate-authors:
	echo "# This file lists all individuals having contributed content to the repository." > AUTHORS
	echo "# For how it is generated, see ./Justfile" >> AUTHORS
	echo >> AUTHORS
	git log --format='%aN <%aE>' | LC_ALL=C.UTF-8 sort -uf >> AUTHORS

_generate-shoulders:
	shoulders -w -n "Vicidial Go"

#
# k8s development cluster
#

clusterName := "vicidial-go"
k3sCtx := "k3d-" + clusterName
localIngressHttpPort := "80"
localIngressHttpsPort := "443"
localApiServerProxyPort := "8081"
repoUri := "github.com/xoe-labs/vicidial-go"

# activate kubectl context
k3d-activate:
	[ -f $HOME/.kube/{{repoUri}}/{{k3sCtx}} ] || just _k3d-extract-kubeconfig {{k3sCtx}}
	k3d cluster start {{clusterName}} --wait
	kubectl config use-context {{k3sCtx}}

# create k3d cluster (and activate)
k3d-create: _k3d-create
	just k3d-activate
	# Container Storage Interface (CSI) related functionlity depends on mount-type-'shared'-volumes
	# Those can be exposed from the host like so (/tmp/k3d/kubelets/pods must exists)
	#   -v /tmp/k3d/kubelet/pods:/var/lib/kubelet/pods:shared \

# destroy k3d cluster completely
k3d-destroy:
	k3d cluster delete {{clusterName}}
	rm "$HOME/.kube/{{repoUri}}/{{k3sCtx}}" || true
	[[ "$(kubectl config --kubeconfig "$HOME/.kube/config" current-context)" == "{{k3sCtx}}" ]] && kubectl config --kubeconfig "$HOME/.kube/config" unset current-context

_k3d-create additionalArgs="":
	#!/usr/bin/env bash
	# Further info on server flags:
	# https://kubernetes.io/docs/reference/command-line-tools-reference/kube-apiserver/
	# https://kubernetes.io/docs/reference/command-line-tools-reference/kube-controller-manager/
	# https://kubernetes.io/docs/reference/command-line-tools-reference/kubelet/
	# review k3s defaults in addition here: https://github.com/rancher/k3s/blob/master/pkg/daemons/control/server.go
	k3d cluster create {{clusterName}} \
	--agents 2 \
	--update-default-kubeconfig=false \
	-p {{localIngressHttpPort}}:80@loadbalancer \
	-p {{localIngressHttpsPort}}:443@loadbalancer \
	--k3s-server-arg '--kube-apiserver-arg=feature-gates=EphemeralContainers=true' \
	--k3s-server-arg '--kube-apiserver-arg=api-audiences=api,spire-server' \
	{{additionalArgs}}

_k3d-extract-kubeconfig ctx:
	#!/usr/bin/env bash
	# set -x
	umask u=rwx,g=,o=
	kubecfgfile="$HOME/.kube/{{repoUri}}/{{ctx}}"
	mkdir -p $(dirname "$kubecfgfile")
	k3dcluster="{{ctx}}"
	k3dcluster="${k3dcluster#k3d-}"
	k3d kubeconfig write "$k3dcluster" -o "$kubecfgfile"
	kubectl config --kubeconfig "$kubecfgfile" unset current-context


_k3d-serve-api:
	kubectl proxy --port={{localApiServerProxyPort}} &
	xdg-open http://localhost:{{localApiServerProxyPort}}
