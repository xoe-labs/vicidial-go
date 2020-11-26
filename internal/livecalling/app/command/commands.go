package command

//go:generate go run ../../../../main.go --config ../../ddd-config.yaml app command --fact-based -t Commands
type Commands struct {
	MakeOutgoingCall          MakeOutgoingCallHandlerWrapper          ``
	MakeOutgoingCallWithoutID MakeOutgoingCallWithoutIDHandlerWrapper ``
	TakeIncomingCall          TakeIncomingCallHandlerWrapper          ``
	HangupCall                HangupCallHandlerWrapper                `command: "topic,hangup"`
	TransferCall              TransferCallHandlerWrapper              `command: "topic,transfer"`
	HoldCall                  HoldCallHandlerWrapper                  `command: "topic,hold"`
	UnholdCall                UnholdCallHandlerWrapper                `command: "topic,hold"`

	StartSpying               StartSpyingHandlerWrapper               `command: "topic,snooping"`
	StopSpying                StopSpyingHandlerWrapper                `command: "topic,snooping"`

	StartWhispering           StartWhisperingHandlerWrapper           `command: "topic,snooping"`
	StopWhispering            StopWhisperingHandlerWrapper            `command: "topic,snooping"`

	StartRecording            StartRecordingHandlerWrapper            `command: "topic,audio"`
	StopRecording             StopRecordingHandlerWrapper             `command: "topic,audio"`

	PlayAudioToBothParties    PlayAudioToBothPartiesHandlerWrapper    `command: "topic,audio"`
	PlayAudioToRemoteParty    PlayAudioToRemotePartyHandlerWrapper    `command: "topic,audio"`
	PlayAudioToLocalParty     PlayAudioToLocalPartyHandlerWrapper     `command: "topic,audio"`
}
