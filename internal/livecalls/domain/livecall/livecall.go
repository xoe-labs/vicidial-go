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
//go:generate go run github.com/phelmkamp/metatag

// A Livecall starts when an audio connection between two parties is established
// and ends when the adio connection is terminated.
type Livecall struct {
	uuid           string      `ddd:"required'missing party UUID'" meta:"equal"`
	lead           party.Party `ddd:"required'missing lead'" meta:"getter;stringer"`
	agentOrService party.Party `ddd:"required'missing agent or service'" meta:"getter;stringer"`
	startTime      time.Time   `ddd:"required'missing start time'"`
	endTime        time.Time   `ddd:"private"`
}
