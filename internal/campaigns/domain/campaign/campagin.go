// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t Campaign
//go:generate go run github.com/phelmkamp/metatag

package campaign

import (

	// "github.com/pkg/errors"
	"github.com/satori/go.uuid"

	"github.com/xoe-labs/vicidial-go/internal/campaigns/domain/lead"
)

// Campaign represents the aggregate of the campaign service
type Campaign struct {
	uuid      uuid.UUID   `ddd:"required,missing campaign UUID;equal"`
	name      string      `ddd:"required,missing campaign name;stringer"`
	active    bool        `ddd:"private;getter"`
	callerId  string      `ddd:"stringer;getter"`
	leads     []lead.Lead `meta:"filter"`
	doNotCall []lead.Lead ``

	availableResultSentinels []string `ddd:"getter"`

	routeUUID string
}
