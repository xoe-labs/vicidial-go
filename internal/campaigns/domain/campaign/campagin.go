// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t Campaign
//go:generate go run github.com/phelmkamp/metatag

package campaign

import (

	// "github.com/pkg/errors"

	"github.com/xoe-labs/vicidial-go/internal/campaigns/domain/lead"
)

// Campaign represents the aggregate of the campaign service
type Campaign struct {
	uuid      string      `ddd:"required'missing campaign UUID'" meta:"equal"`
	name      string      `ddd:"required'missing campaign name'" meta:"stringer"`
	active    bool        `ddd:"private" meta:"getter"`
	callerId  string      `meta:"stringer;getter"`
	leads     []lead.Lead `meta:"filter"`
	doNotCall []lead.Lead ``

	availableResultSentinels []string `meta:"getter"`

	routeUUID string
}
