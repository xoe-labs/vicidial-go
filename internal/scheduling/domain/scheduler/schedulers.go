// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

//go:generate go run github.com/phelmkamp/metatag

package scheduler

import (
	"fmt"
	"github.com/pkg/errors"
)

// Schedulers wraps a slice of schedulers
type Schedulers struct {
	schedulers []Scheduler
}

func (ss Schedulers) validate(s Scheduler) error {
	// agents can only be assigned to one scheduler at a time
	for _, agent := range s.assignedAgents {
		for _, existingScheduler := range ss.schedulers {
			for _, assignedAgent := range existingScheduler.assignedAgents {
				if agent.Equal(assignedAgent) {
					return errors.WithStack(fmt.Errorf("agent %s, scheduler %s: %w", agent, ss, ErrAgentAlreadyAssigned))
				}
			}
		}
	}
	return nil
}
