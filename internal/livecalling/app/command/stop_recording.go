// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

package command

import (
	"context"

	"github.com/satori/go.uuid"

	cerrors "github.com/xoe-labs/vicidial-go/internal/common/errors"

	// import adapters to other services (if any) here

	"github.com/xoe-labs/vicidial-go/internal/livecalling/app"

	"github.com/xoe-labs/vicidial-go/internal/livecalling/domain"
	"github.com/xoe-labs/vicidial-go/internal/livecalling/domain/livecall"
)

const (
	// ErrNotAuthorizedToStopRecording signals that the command issuer is not authorized to stop the recording
	ErrNotAuthorizedToStopRecording = cerrors.CommonError("ErrNotAuthorizedToStopRecording")
)

// StopRecordingHandler knows how to stop a recording
type StopRecordingHandler struct {
	aggregate domain.Repository
	commMgr   domain.CommManager
	policy    app.Policy
}

// NewStopRecordingHandler returs a StopRecordingHandler
func NewStopRecordingHandler(aggregate domain.Repository, commMgr domain.CommManager) StopRecordingHandler {
	if aggregate == nil {
		panic("nil aggregate")
	}
	if commMgr == nil {
		panic("nil commMgr")
	}
	return StopRecordingHandler{aggregate: aggregate, commMgr: commMgr}
}

// Handle stops a recording
func (h StopRecordingHandler) Handle(ctx context.Context, livecallToStopRecordingFor, userID uuid.UUID, elevationToken string) error {

	if err := h.aggregate.Update(ctx, livecallToStopRecordingFor, func(l *livecall.Livecall) error {
		if ok := h.policy.Can(ctx, "StopRecording", userID, elevationToken, *l); !ok {
			return ErrNotAuthorizedToStopRecording
		}
		if err := l.StopRecording(h.commMgr); err != nil {
			return err
		}
		return nil
	}); err != nil {
		return err
	}

	return nil
}
