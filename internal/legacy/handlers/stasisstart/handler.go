// Copyright © 2020 Lina Avendano <lav@xoe.solutions>
// SPDX-License-Identifier: MIT

package stasisstart

import (
	stdSQL "database/sql"

	"github.com/CyCoreSystems/ari/v5"

	"github.com/blaggacao/vicidial-go/internal/legacy/handlers"
)


type EventHandler struct {
	event *ari.StasisStart
}

func (h EventHandler) SetEvent(e *ari.Event) {
	_, h.event = e.(*ari.StasisStart)
}

func (h EventHandler) GetTxHandler() (func (tx *stdSQL.Tx) error) {
	return func (tx *stdSQL.Tx) {
		if err := h.publish2VicidialSipEventLog(tx); err != nil {
			return err
		}
		return nil
	}

}

// EventHandler implements handlers.EventHandler
var _ handlers.EventHander = (*EventHandler)(nil)
