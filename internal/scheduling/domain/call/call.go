// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t Call

package call

import (
	// "github.com/pkg/errors"

	"github.com/xoe-labs/vicidial-go/internal/common/party"

	// cErrors "github.com/xoe-labs/vicidial-go/internal/common/errors"
)

type meta struct {
	leadUUID string
}

// Call represents a calling schedule for a group of agents.
type Call struct {
	meta meta
	remoteParty party.RemoteParty ``
	localParty  party.LocalParty  ``
}

