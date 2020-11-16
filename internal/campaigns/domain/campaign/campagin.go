// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t Campaign
//go:generate go run github.com/phelmkamp/metatag

package campaign

import (

	// "github.com/pkg/errors"

	"github.com/blaggacao/vicidial-go/internal/campaigns/domain/lead"
	// cErrors "github.com/blaggacao/vicidial-go/internal/common/errors"
)

// A Campaign starts when an audio connection between two parties is established
// and ends when the adio connection is terminated.
type Campaign struct {
	uuid        string `ddd:"required'missing campaign UUID'" meta:"equal"`
	name        string `ddd:"required'missing capmaing name'" meta:"stringer"`
	active      bool   `ddd:"private" meta:"getter"`
	callerId    string `meta:"stringer;getter"`
	leads       []lead.Lead
	doNotCall   []lead.Lead
	resultCodes []string

	dialFilter string

	routerUUID    string
	schedulerUUID string
}
