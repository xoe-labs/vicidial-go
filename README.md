# vicidial-go

:smile: A (gradual) re-implementation of vicidial in golang

[![go.dev reference](https://img.shields.io/badge/go.dev-reference-007d9c?logo=go&logoColor=white)](https://pkg.go.dev/blaggacao/vicidial-go)
[![License](https://img.shields.io/badge/license-MIT-%2397ca00.svg)](https://github.com/xoe-labs/vicidial-go/blob/master/COPYRIGHT)
[![GitHub release](https://img.shields.io/github/release/blaggacao/vicidial-go.svg)](https://github.com/xoe-labs/vicidial-go/releases)
[![Docker Metrics](https://images.microbadger.com/badges/image/blaggacao/vicidial-go.svg)](https://microbadger.com/images/blaggacao/vicidial-go)
[![Devshell Dev Environment](https://img.shields.io/badge/nix-devshell-blue?logo=NixOS&labelColor=ccc)](github.com/numtide/devshell)
[![Made by David Arnold](https://img.shields.io/badge/made%20by-David%20Arnold-blue.svg?style=flat)](https://github.com/blaggacao)

[![Go](https://github.com/xoe-labs/vicidial-go/workflows/Go/badge.svg)](https://github.com/xoe-labs/vicidial-go/actions?query=workflow%3AGo)
[![Release](https://github.com/xoe-labs/vicidial-go/workflows/Release/badge.svg)](https://github.com/xoe-labs/vicidial-go/actions?query=workflow%3ARelease)
[![PR](https://github.com/xoe-labs/vicidial-go/workflows/PR/badge.svg)](https://github.com/xoe-labs/vicidial-go/actions?query=workflow%3APR)
[![codecov](https://codecov.io/gh/blaggacao/vicidial-go/branch/master/graph/badge.svg)](https://codecov.io/gh/blaggacao/vicidial-go)
[![Go Report Card](https://goreportcard.com/badge/moul.io/golang-repo-template)](https://goreportcard.com/report/moul.io/golang-repo-template)
<!--
[![CodeFactor](https://www.codefactor.io/repository/github/blaggacao/vicidial-go/badge)](https://www.codefactor.io/repository/github/blaggacao/vicidial-go)
-->

## Usage

[embedmd]:# (.tmp/usage.txt console)
```console
foo@bar:~$$ vicigo event-router



foo@bar:~$$ vicigo adaptive-dialer
```

## Install

### Releases

See https://github.com/xoe-labs/vicidial-go/releases

## Contribute

[![Devshell Dev Environment](https://img.shields.io/badge/nix-devshell-blue?logo=NixOS&labelColor=ccc)](github.com/numtide/devshell)

We use _devshell_ an extension to `nix-shell` to provide you (on linux/mac \*) with a convenient, reproducible developer environment.
First time running `nix-shell` will take some time, subsequent runs are instantaneous.

\* windows is currently not supported: you have to build the environment yourself. The most important binaries are: `go`, `just` and `sqlc`.

```console
$ curl -L https://nixos.org/nix/install | sh

$ gh repo fork blaggacao/vicidial-go

$ nix-shell

$ menu
$ just-menu
```

I really welcome contributions.
Your input is the most precious material.
I'm well aware of that and I thank you in advance.
Everyone is encouraged to look at what they can do on their own scale;
no effort is too small.

Everything on contribution is summed up here: [CONTRIBUTING.md](./CONTRIBUTING.md)

### Contributors ✨

<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-2-orange.svg)](#contributors)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/blaggacao"><img src="https://avatars2.githubusercontent.com/u/7548295?v=4?s=100" width="100px;" alt=""/><br /><sub><b>David Arnold</b></sub></a><br /><a href="#maintenance-blaggacao" title="Maintenance">🚧</a> <a href="https://github.com/xoe-labs/vicidial-go/commits?author=blaggacao" title="Documentation">📖</a> <a href="https://github.com/xoe-labs/vicidial-go/commits?author=blaggacao" title="Tests">⚠️</a> <a href="https://github.com/xoe-labs/vicidial-go/commits?author=blaggacao" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/lina2358"><img src="https://avatars2.githubusercontent.com/u/31328370?s=460&v=4?s=100" width="100px;" alt=""/><br /><sub><b>Lina Avendano</b></sub></a><br /><a href="#financial-lina2358" title="Financial">💵</a> <a href="#business-lina2358" title="Business development">💼</a> <a href="#ideas-lina2358" title="Ideas, Planning, & Feedback">🤔</a> <a href="#projectManagement-lina2358" title="Project Management">📆</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors)
specification. Contributions of any kind welcome!

### Stargazers over time

[![Stargazers over time](https://starchart.cc/blaggacao/vicidial-go.svg)](https://starchart.cc/blaggacao/vicidial-go)

## License

© 2020 David Arnold

Licensed under the the [MIT license](https://opensource.org/licenses/MIT)
([`LICENSE`](LICENSE)).
See the [`COPYRIGHT`](COPYRIGHT) file for more details.

`SPDX-License-Identifier: MIT`
