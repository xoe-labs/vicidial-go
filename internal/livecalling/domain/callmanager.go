// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

package domain

import (
	l "github.com/xoe-labs/vicidial-go/internal/livecalling/domain/livecall"

)

// CallManager is the interface that wraps the communication manager implementation.
type CallManager interface {
	l.RecordingManager
	l.AudioManager
}
