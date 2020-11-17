// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t Agent
//go:generate go run github.com/phelmkamp/metatag

package agent

// Agent represents an agent assigned to a scheduler
// it does not know anything about the agent's state (eg. availability)
type Agent struct {
	uuid string `ddd:"required'missing UUID'" meta:"equal"`
	name string `ddd:"required'missing name'" meta:"stringer"`
}

