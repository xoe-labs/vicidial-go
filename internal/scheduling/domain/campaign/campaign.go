// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t Campaign
//go:generate go run github.com/phelmkamp/magnum

package campaign

import (
	"github.com/satori/go.uuid"
)

type priority struct {
	name   string `enum:"high,normal,low"`
	factor int    `enum:"3,2,1"`
}

// Campaign represents a capaign covered by a scheduler
type Campaign struct {
	uuid     uuid.UUID `ddd:"getter"`
	name     string    `ddd:"getter"`
	priority priority  `ddd:"getter"`
}
