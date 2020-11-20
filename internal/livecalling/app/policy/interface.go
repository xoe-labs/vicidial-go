// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

package policy

import (
	"context"
	"github.com/satori/go.uuid"
)

type Policer interface {
	Can(ctx context.Context, p Policeable, action string, data []byte) bool
}

type Policeable interface {
	User() uuid.UUID
	ElevationToken() string
}
