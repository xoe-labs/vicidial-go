// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

package app

import (
	"context"

	"github.com/satori/go.uuid"

	"github.com/xoe-labs/vicidial-go/internal/livecalling/domain/livecall"
)
type Policy interface {
	Can(ctx context.Context, action string, user uuid.UUID, elevationToken string, l livecall.Livecall) bool
}
