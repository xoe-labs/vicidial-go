// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

package domain

import (
	"context"
	"fmt"

	l "./livecall"
)

// NotFoundError ...
type NotFoundError struct {
	LivecallUUID string
}

// Error implements the error interface
func (e NotFoundError) Error() string {
	return fmt.Sprintf("livecall '%s' not found", e.LivecallUUID)
}

// Repository is the interface that wraps the persitence layer.
//
// If a requested uuid is not found, it is expected to return
// NotFoundError to allow the domain to handle it.
type Repository interface {
	AddLivecall(ctx context.Context, lc *l.Livecall) error

	GetLivecall(ctx context.Context, livecallUUID string, user User) (*l.Livecall, error)

	UpdateLivecall(
		ctx context.Context,
		livecallUUID string,
		user User,
		updateFn func(ctx context.Context, lc *l.Livecall) (*l.Livecall, error),
	) error
}
