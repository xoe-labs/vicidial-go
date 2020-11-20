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

	// Delete deletes a livecall from the repository by its identifier
	Delete(ctx context.Context, identifiable Identifiable) error

	// Get gets a livecall from the repository by its identifier
	Get(ctx context.Context, identifiable Identifiable) (*l.Livecall, error)

	// Update updates a livecall in the repository by its identifier through an update function
	Update(ctx context.Context, identifiable Identifiable, updateFn func(l *l.Livecall) error) error
}

// Identifiable knows how to identify an object
type Identifiable interface {
	Identifier() uuid.UUID
}
