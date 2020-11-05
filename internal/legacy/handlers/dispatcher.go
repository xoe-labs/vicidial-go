// Copyright © 2020 Lina Avendano <lav@xoe.solutions>
// SPDX-License-Identifier: MIT

package handlers

import (
	stdSQL "database/sql"

	"github.com/ThreeDotsLabs/watermill"
	"github.com/ThreeDotsLabs/watermill/message"
	"github.com/CyCoreSystems/ari/v5"

	"github.com/blaggacao/vicidial-go/internal/legacy/handlers/stasisstart"
	"github.com/blaggacao/vicidial-go/internal/legacy/handlers/channel"
)

var (
	logger        = watermill.NewStdLogger(false, false)
	postgresTable = "users"
	mysqlTable    = "users"
)

type EventHandler interface {
	SetEvent (e *ari.Event)
	GetTxHandler() (func (tx *stdSQL.Tx) error)

}

type VicidialLegacyDispatcher struct {
	db *stdSQL.DB
}

func (vld VicidialLegacyDispatcher) Handler(msg *message.Message) (error) {
	// decodes ARI events - we only process ari events by this handler
	if event, err := ari.DecodeEvent(message.Payload); err != nil {
		return err
	}

	// identifies events and dispatches to its handler
	var h EventHandler;
	switch e := event.(type) {
	case ari.StasisStart:
		h = stasisstart.EventHandler{}
	case ari.ChannelCreated:
		h = channel.CreatedEventHandler{}
	case ari.ChannelDestroyed:
		h = channel.DestroyedEventHandler{}
	default: // we disregard all other events
		return nil
	}
	h.SetEvent(*event)

	// executes the handler within a db transaction
	if err = dbTx(vld.db, h); err != nil {
		return error
	}

	return nil
}

func dbTx(db *stdSQL.DB, h EventHandler) (error) {
	// Begin database transaction to write to all target tables atomically
	if tx, err := db.Begin(); err != nil {
		return err
	}

	if err = h.GetTxHandler()(tx); err != nil {
		rollbackErr := tx.Rollback()
		if rollbackErr != nil {
			panic(rollbackErr)
		}
		return err
	}

	if err = tx.Commit(); err != nil {
		return err
	}

}
