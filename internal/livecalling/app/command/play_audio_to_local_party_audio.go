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
	// ErrNotAuthorizedToPlayAudioToLocalParty signals that the command issuer is not authorized to play the audio to the local party
	ErrNotAuthorizedToPlayAudioToLocalParty = cerrors.AuthorizationError("ErrNotAuthorizedToPlayAudioToLocalParty")
)

// PlayAudioToLocalPartyHandler knows how to play an audio
type PlayAudioToLocalPartyHandler struct {
	aggregate domain.Repository
	callMgr   domain.CallManager
	policy    app.Policy
}

// NewPlayAudioToLocalPartyHandler returs a PlayAudioToLocalPartyHandler
func NewPlayAudioToLocalPartyHandler(aggregate domain.Repository, callMgr domain.CallManager) PlayAudioToLocalPartyHandler {
	if aggregate == nil {
		panic("nil aggregate")
	}
	if callMgr == nil {
		panic("nil callMgr")
	}
	return PlayAudioToLocalPartyHandler{aggregate: aggregate, callMgr: callMgr}
}

// Handle plays an audio to the local party
func (h PlayAudioToLocalPartyHandler) Handle(ctx context.Context, livecallToPlayAudioToLocalPartyFor, userID uuid.UUID, elevationToken string) error {

	if err := h.aggregate.Update(ctx, livecallToPlayAudioToLocalPartyFor, func(l *livecall.Livecall) error {
		if ok := h.policy.Can(ctx, "PlayAudioToLocalParty", userID, elevationToken, *l); !ok {
			return ErrNotAuthorizedToPlayAudioToLocalParty
		}
		if err := l.PlayAudioToLocalParty(h.callMgr); err != nil {
			return err
		}
		return nil
	}); err != nil {
		return err
	}

	return nil
}
