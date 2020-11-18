// Copyright © 2020 David Arnold <dar@xoe.solutions>
// SPDX-License-Identifier: MIT

package livecall

import (
	"time"

	"github.com/ttacon/uri"

	cerrors "github.com/xoe-labs/vicidial-go/internal/common/errors"
)

type RecordingManager interface {
	// StartRecording()
}

const (
	// ErrUnableToStartRecording signals that the recording could not be started
	ErrUnableToStartRecording = cerrors.CommonError("ErrUnableToStartRecording")
	// ErrUnableToStopRecording signals that the recording could not be started
	ErrUnableToStopRecording = cerrors.CommonError("ErrUnableToStopRecording")
)

// livecall recording domain topic
type livecallRecording struct {
	recordingStartTime time.Time
	recordingStopTime  time.Time
	recordingFileURI   uri.URI
}

// StartRecording starts a recording through a communications manager
func (l *Livecall) StartRecording(m RecordingManager) error {
	// TODO: implement start recording on communications manager
	return nil
}

// StopRecording stops a recording through a communications manager
func (l *Livecall) StopRecording(m RecordingManager) error {
	// TODO: implement stop recording on communications manager
	return nil
}
