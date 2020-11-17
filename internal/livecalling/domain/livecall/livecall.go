// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t Livecall
//go:generate go run github.com/phelmkamp/metatag

package livecall

import (
	"time"

	// "github.com/pkg/errors"

	"github.com/xoe-labs/vicidial-go/internal/common/party"
)

type meta struct {
	leadUUID     string
	campaignUUID string
	scheduleUUID string
}

// Livecall represents a call either dialed or received
type Livecall struct {
	meta meta

	uuid              string             `ddd:"required'missing UUID'" meta:"equal"`
	lead              party.RemoteParty  `ddd:"required'missing lead'" meta:"getter;stringer"`
	localParty        party.LocalParty   `meta:"getter;stringer"`
	localPartyHistory []party.LocalParty ``
	startTime         time.Time          ``
	endTime           time.Time          `ddd:"private"`

	resultSentinel string `ddd:"private" meta:"setter"`
	recording      string
}

func (l *Livecall) IsResolved() bool {
	return l.localParty != party.LocalParty{}
}
