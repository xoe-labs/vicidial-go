// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

package domain

import (
	"context"
	"fmt"

	"github.com/satori/go.uuid"

	l "github.com/xoe-labs/vicidial-go/internal/livecalling/domain/livecall"
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
	// Add adds a livecall to the repository
	Add(ctx context.Context, l *l.Livecall) error

	// Get gets a livecall from the repository by its uuid
	Get(ctx context.Context, uuid uuid.UUID) (*l.Livecall, error)

	// Update updates a livecall in the repository by its uuid through an update function
	Update(ctx context.Context, uuid uuid.UUID, updateFn func(l *l.Livecall) error) error
}
