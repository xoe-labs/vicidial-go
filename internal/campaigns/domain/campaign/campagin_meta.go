// GENERATED BY metatag, DO NOT EDIT
// (or edit away - I'm a comment, not a cop)

package campaign

import (
	"fmt"
	"github.com/xoe-labs/vicidial-go/internal/campaigns/domain/lead"
)

// Equal answers whether v is equivalent to c.
// Always returns false if v is not a Campaign.
func (c Campaign) Equal(v interface{}) bool {
	c2, ok := v.(Campaign)
	if !ok {
		return false
	}
	if c.uuid != c2.uuid {
		return false
	}
	return true
}

// String returns the "native" format of Campaign. Implements the fmt.Stringer interface.
func (c Campaign) String() string {
	return fmt.Sprintf("%v %v", c.name, c.callerId)
}

// Active returns the value of active.
func (c Campaign) Active() bool {
	return c.active
}

// CallerId returns the value of callerId.
func (c Campaign) CallerId() string {
	return c.callerId
}

// FilterLeads returns a copy of leads, omitting elements that are rejected by the given function.
func (c Campaign) FilterLeads(fn func(lead.Lead) bool) []lead.Lead {
	return c.FilterLeadsN(fn, -1)
}

// FilterLeadsN returns a copy of leads, omitting elements that are rejected by the given function.
// The n argument determines the maximum number of elements to return (n < 1: all elements).
func (c Campaign) FilterLeadsN(fn func(lead.Lead) bool, n int) []lead.Lead {
	cap := n
	if n < 1 {
		cap = len(c.leads)
	}
	result := make([]lead.Lead, 0, cap)
	for i := range c.leads {
		if fn(c.leads[i]) {
			if result = append(result, c.leads[i]); len(result) >= cap {
				break
			}
		}
	}
	return result
}

// AvailableResultSentinels returns the value of availableResultSentinels.
func (c Campaign) AvailableResultSentinels() []string {
	return c.availableResultSentinels
}