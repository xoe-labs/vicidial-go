// Copyright © 2020 Lina Avendano <lav@xoe.solutions>
// SPDX-License-Identifier: MIT

package channel

import (
	"context"
	stdSQL "database/sql"

	"github.com/CyCoreSystems/ari/v5"

	"github.com/blaggacao/vicidial-go/internal/legacy"
	"github.com/blaggacao/vicidial-go/internal/legacy/generated/channels"
)

// CreatedEventHandler handles ari.ChannelCreated events
type CreatedEventHandler struct {
	event *ari.ChannelCreated
}

func (h CreatedEventHandler) SetEvent(e *ari.Event) {
	_, h.event = e.(*ari.StasisStart)
}

func (h CreatedEventHandler) GetTxHandler() (func (tx *stdSQL.Tx) error) {
	return func (tx *stdSQL.Tx) {
		if err := h.createChannels(tx); err != nil {
			return err
		}
		return nil
	}

}

// CreatedEventHandler implements handlers.EventHandler
var _ handlers.EventHander = (*CreatedEventHandler)(nil)

// createChannels creates some new channels in live_sip_channels and others in live_channels
// otherchannels are completely ignored
func (h CreatedEventHandler) createChannels(tx *stdSQL.Tx) (error) {
	e := h.event
	q := channels.New(tx)
	cid := legacy.GetValidCidOutOf(e.Caller, e.Connected)
	err := q.CreateSipLiveChannel(context.TODO(), channels.CreateSipLiveChannelParams{
		Channel = e.Channel.GetName(),
		// ServerIP = e.Channel.ServerIP,
		Extension = e.Channel.ID,
		// ChannelData = e.Channel.SIPCallID,
	})
	if err != nil {
		return err
	}
	err := q.CreateLiveChannel(context.TODO(), channels.CreateSipChannelParams{
		Channel = e.Channel.GetName(),
		// ServerIP = e.Channel.ServerIP,
		Extension = e.Channel.Dialplan.GetExten(),
		// ChannelData = e.Channel.SIPCallID,
	})
	if err != nil {
		return err
	}
	return nil
}
