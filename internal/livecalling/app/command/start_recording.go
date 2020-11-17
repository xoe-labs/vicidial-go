// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

package command

import (
	"context"

	"github.com/satori/go.uuid"

	cerrors "github.com/xoe-labs/vicidial-go/internal/common/errors"

	// import adapters to other services (if any) here

	"github.com/xoe-labs/vicidial-go/internal/livecalling/domain"
	"github.com/xoe-labs/vicidial-go/internal/livecalling/domain/livecall"
)

const (
	// ErrUnableToStartRecording signals that a recording could not be started
	ErrUnableToStartRecording = cerrors.CommonError("ErrUnableToStartRecording")
)

// StartRecordingHandler knows how to start a recording
type StartRecordingHandler struct {
	aggregate domain.Repository
}

// NewStartRecordingHandler returs a StartRecordingHandler
func NewStartRecordingHandler(aggregate domain.Repository) StartRecordingHandler {
	if aggregate == nil {
		panic("nil aggregate")
	}
	return StartRecordingHandler{aggregate: aggregate}
}

// Handle starts a recording
func (h StartRecordingHandler) Handle(ctx context.Context, livecallToStartRecordingFor uuid.UUID) error {

	err := h.aggregate.Update(ctx, livecallToStartRecordingFor, func(l *livecall.Livecall) error {
		// TODO: implement start recording
		return nil
	})

	if err != nil {
		return ErrUnableToStartRecording
	}

	return nil
}



