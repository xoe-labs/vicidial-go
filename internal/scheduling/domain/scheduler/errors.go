// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

package scheduler

type schedulerError string
func (e schedulerError) Error() string { return string(e) }

const (
	ErrAgentAlreadyAssigned = schedulerError("ErrAgentAlreadyAssigned")
)
