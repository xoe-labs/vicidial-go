// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

package livecall

import (
	"time"

	// "github.com/pkg/errors"

	"github.com/blaggacao/vicidial-go/internal/livecalls/domain/party"

	// cErrors "github.com/blaggacao/vicidial-go/internal/common/errors"
)

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t Livecall

// A Livecall starts when an audio connection between two parties is established
// and ends when the adio connection is terminated.
type Livecall struct {
	uuid           *string      `gen:"getter" ddd:"required'missing party UUID'"`
	agentOrService *party.Party `gen:"getter" ddd:"required'missing agent or service'"`
	lead           *party.Party `gen:"getter" ddd:"required'missing lead'"`
	startTime      *time.Time   `gen:"getter" ddd:"required'missing start time'"`
	endTime        *time.Time   `gen:"getter" ddd:"private"`
}

