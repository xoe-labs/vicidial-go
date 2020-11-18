// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t Livecall

package livecall

import (
	"time"

	// "github.com/pkg/errors"
	"github.com/satori/go.uuid"

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

	uuid              uuid.UUID          `ddd:"required,missing UUID;equal"`
	lead              party.RemoteParty  `ddd:"required,missing lead;getter;stringer"`
	localParty        party.LocalParty   `ddd:"getter;stringer"`
	localPartyHistory []party.LocalParty ``
	startTime         time.Time          ``
	endTime           time.Time          `ddd:"private"`

	resultSentinel string `ddd:"private;setter"`

	livecallRecording
	livecallPlayAudio
}

// IsResolved returns true if the livecall has a local party
// local party can come from resolving a route or can be preexisting ("overridden")
func (l *Livecall) IsResolved() bool {
	return l.localParty != party.LocalParty{}
}
