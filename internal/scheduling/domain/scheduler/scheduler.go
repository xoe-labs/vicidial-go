// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

//go:generate go run github.com/xoe-labs/go-generators/ddd-domain-gen -t Scheduler
//go:generate go run github.com/phelmkamp/metatag

package scheduler

import (
	// "fmt"
	// "github.com/pkg/errors"

	"github.com/xoe-labs/vicidial-go/internal/scheduling/domain/agent"
	"github.com/xoe-labs/vicidial-go/internal/scheduling/domain/call"
	"github.com/xoe-labs/vicidial-go/internal/scheduling/domain/campaign"
	"github.com/xoe-labs/vicidial-go/internal/scheduling/domain/leadqueryfilter"
)

// Scheduler represents a call scheduler for a group of agents.
type Scheduler struct {
	uuid string `ddd:"required'missing UUID'" meta:"equal"`
	name string `ddd:"required"missing name'" meta:"stringer"`

	coveredCampaigns []campaign.Campaign             `meta:"getter"`
	callQueue        []call.Call                     `ddd:"private"`
	callQueueMinSize int                             `ddd:"required'queue min size is missing'`
	leadQueryFilter  leadqueryfilter.LeadQueryFilter ``

	assignedAgents []agent.Agent ``
}

// ShouldFillQueue returns if the calling queue should be filled
func (s *Scheduler) ShouldFillQueue() bool {
	if len(s.callQueue) < s.callQueueMinSize {
		return true
	}
	return false
}

// LeadsToRequest returns the number of leads that should be requested per
// campaign to fill the call queue according to campaign's priority level.
func (s *Scheduler) LeadsToRequest() map[campaign.Campaign]int {
	var totalRequesting int
	var leadsPerCampaign map[campaign.Campaign]int
	// while there is still room to fill ...
	for (s.callQueueMinSize - len(s.callQueue)) > totalRequesting {
		// ... go over campaigns and add leads to request by priority factor
		for _, c := range s.coveredCampaigns {
			totalRequesting += c.Priority().Factor()
			leadsPerCampaign[c] += c.Priority().Factor()
		}
	}
	return leadsPerCampaign
}

func (s *Scheduler) PutInQueue(calls []call.Call) {
	s.callQueue = append(s.callQueue, calls...)
}
