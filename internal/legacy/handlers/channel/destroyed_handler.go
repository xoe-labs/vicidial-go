// Copyright © 2020 Lina Avendano <lav@xoe.solutions>
// SPDX-License-Identifier: MIT

package channel

import (
	stdSQL "database/sql"

	"github.com/CyCoreSystems/ari/v5"

	"github.com/blaggacao/vicidial-go/internal/legacy/handlers"
)

// DestroyedEventHandler handles ari.ChannelDestroyed events
type DestroyedEventHandler struct {
	event *ari.ChannelDestroyed
}

func (h DestroyedEventHandler) SetEvent(e *ari.Event) {
	_, h.event = e.(*ari.StasisStart)
}

func (h DestroyedEventHandler) GetTxHandler() (func (tx *stdSQL.Tx) error) {
	return func (tx *stdSQL.Tx) {
		if err := h.publish2VicidialSipEventLog(tx); err != nil {
			return err
		}
		return nil
	}

}

// DestroyedEventHandler implements handlers.EventHandler
var _ handlers.EventHander = (*DestroyedEventHandler)(nil)
