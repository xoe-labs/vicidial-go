// Copyright © 2020 Lina Avendano <lav@xoe.solutions>
// SPDX-License-Identifier: MIT

package stasisstart
import (
	"fmt"
	"context"

	stdSQL "database/sql"

	"github.com/blaggacao/vicidial-go/internal/api/sql/vicilogs"
)

func (h EventHandler) publish2VicidialSipEventLog(tx *stdSQL.Tx) (error) {
	e := h.event
	q := vicilogs.New(tx)

	sipCallID, ok = e.Channel.GetChannelVars()["SIPCALLID"]
	if !ok {
		return fmt.Error("no SIPCALLID on channel", e.Channel.GetName())
	}
	return q.CreateSipEventLog(context.TODO(), vicilogs.CreateSipEventLogParams{
		CallerCode = e.Channel.Caller.String(),
		Channel = e.Channel.GetName(),
		// ServerIP = e.Channel.ServerIP,
		UniqueID = e.Channel.GetID(),
		SIPCallID = sipCallID,
		EventDate = e.Channel.GetCreationtime(),
		// SIPEvent = e.Channel.SIPEvent, //Endpoint.State?


	})
}

func (h EventHandler) publish2VicidialEventRecent(tx *stdSQL.Tx) (error) {
	return vicilogs.CreateSipEventRecent(vicilogs.SipEventRecent{
		CallerId = e.Channel.Caller
	})
}
