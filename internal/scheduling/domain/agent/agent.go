// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t Agent

package agent

import (
	"github.com/satori/go.uuid"
)

// Agent represents an agent assigned to a scheduler
// it does not know anything about the agent's state (eg. availability)
type Agent struct {
	uuid uuid.UUID `ddd:"required,missing UUID;equal"`
	name string    `ddd:"required,missing name;stringer"`
}
