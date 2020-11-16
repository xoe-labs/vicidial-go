// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t Livecall
//go:generate go run github.com/phelmkamp/metatag

package livecall

import (
	"time"
	"fmt"

	// "github.com/pkg/errors"

	"github.com/blaggacao/vicidial-go/internal/common/party"
	// cErrors "github.com/blaggacao/vicidial-go/internal/common/errors"
)

type meta struct {
	leadUUID     string
	scheduleUUID string
}

// A Livecall represents a call either dialed or received
type Livecall struct {
	meta meta

	uuid                  string             `ddd:"required'missing UUID'" meta:"equal"`
	lead                  party.RemoteParty  `ddd:"required'missing lead'" meta:"getter;stringer"`
	agentOrService        party.LocalParty   `meta:"getter;stringer"`
	agentOrServiceHistory []party.LocalParty ``
	startTime             time.Time          ``
	endTime               time.Time          `ddd:"private"`
	routeUUID             string             `` // ask for routing of lead-only livecall

	resultCodes []string `ddd:"required'missing result codes'"`
	resultCode  string   `ddd:"private"`
	recording   string
}

func (l Livecall) validate() error {
	if (l.agentOrService != party.LocalParty{}) && (l.routeUUID != "") {
		return fmt.Errorf("livecall has both, local party and route, set")
	}
	return nil
}
