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
	// ErrNotAuthorizedToPlayAudioToRemoteParty signals that the command issuer is not authorized to play the audio to the remote party
	ErrNotAuthorizedToPlayAudioToRemoteParty = cerrors.AuthorizationError("ErrNotAuthorizedToPlayAudioToRemoteParty")
)

// PlayAudioToRemotePartyHandler knows how to play an audio
type PlayAudioToRemotePartyHandler struct {
	aggregate domain.Repository
	callMgr   domain.CallManager
	policy    app.Policy
}

// NewPlayAudioToRemotePartyHandler returs a PlayAudioToRemotePartyHandler
func NewPlayAudioToRemotePartyHandler(aggregate domain.Repository, callMgr domain.CallManager) PlayAudioToRemotePartyHandler {
	if aggregate == nil {
		panic("nil aggregate")
	}
	if callMgr == nil {
		panic("nil callMgr")
	}
	return PlayAudioToRemotePartyHandler{aggregate: aggregate, callMgr: callMgr}
}

// Handle plays an audio to the remote party
func (h PlayAudioToRemotePartyHandler) Handle(ctx context.Context, livecallToPlayAudioToRemotePartyFor, userID uuid.UUID, elevationToken string) error {

	if err := h.aggregate.Update(ctx, livecallToPlayAudioToRemotePartyFor, func(l *livecall.Livecall) error {
		if ok := h.policy.Can(ctx, "PlayAudioToRemoteParty", userID, elevationToken, *l); !ok {
			return ErrNotAuthorizedToPlayAudioToRemoteParty
		}
		if err := l.PlayAudioToRemoteParty(h.callMgr); err != nil {
			return err
		}
		return nil
	}); err != nil {
		return err
	}

	return nil
}
