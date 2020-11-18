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
	// ErrNotAuthorizedToPlayAudioToBothParties signals that the command issuer is not authorized to play the audio to both parties
	ErrNotAuthorizedToPlayAudioToBothParties = cerrors.CommonError("ErrNotAuthorizedToPlayAudioToBothParties")
)

// PlayAudioToBothPartiesHandler knows how to play an audio
type PlayAudioToBothPartiesHandler struct {
	aggregate domain.Repository
	commMgr   domain.CommManager
	policy    app.Policy
}

// NewPlayAudioToBothPartiesHandler returs a PlayAudioToBothPartiesHandler
func NewPlayAudioToBothPartiesHandler(aggregate domain.Repository, commMgr domain.CommManager) PlayAudioToBothPartiesHandler {
	if aggregate == nil {
		panic("nil aggregate")
	}
	if commMgr == nil {
		panic("nil commMgr")
	}
	return PlayAudioToBothPartiesHandler{aggregate: aggregate, commMgr: commMgr}
}

// Handle plays an audio to both parties
func (h PlayAudioToBothPartiesHandler) Handle(ctx context.Context, livecallToPlayAudioToBothPartiesFor, userID uuid.UUID, elevationToken string) error {

	if err := h.aggregate.Update(ctx, livecallToPlayAudioToBothPartiesFor, func(l *livecall.Livecall) error {
		if ok := h.policy.Can(ctx, "PlayAudioToBothParties", userID, elevationToken, *l); !ok {
			return ErrNotAuthorizedToPlayAudioToBothParties
		}
		if err := l.PlayAudioToBothParties(h.commMgr); err != nil {
			return err
		}
		return nil
	}); err != nil {
		return err
	}

	return nil
}
