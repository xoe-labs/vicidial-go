// Copyright © 2020 Lina Avendano <lav@xoe.solutions>
// SPDX-License-Identifier: MIT

package legacy

import (
	"regexp"

	"github.com/CyCoreSystems/ari/v5"
)

type CIDType string

const {
	CIDTypeThreeWayTransfer CIDType = "DC"
	CIDTypeManualDials      CIDType = "M"
	CIDTypeAutoDials        CIDType = "V"
	CIDTypeInboundCalls     CIDType = "Y"
	CIDTypeRinagent         CIDType = "RA"
}

var {
	ThreeWayTransferMatcher = regexp.Compile("DC\d\d\d\d\d\dW\d\d\d\d\d\d\d\d\d\dW")
	ManualDialsMatcher 		= regexp.Compile("M\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d")
	AutoDialsMatcher 		= regexp.Compile("V\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d")
	InboundCallsMatcher 	= regexp.Compile("Y\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d")
	RingagentMatcher 		= regexp.Compile("^RINGAGENT.{11}|^RA_.{17}")
}

GetValidCidOutOf(caller, connected ari.CallerID) string {
	// remove everything after space for Orex
	mcCidType, mcString := GetValidVicidialCID(caller)
	ccCidType, ccString := GetValidVicidialCID(connected)
	if mcCidType == nil && ccCidType != nil{
		return ccString
	} else {
		return mcString // can be "" - TODO: check, it's weird
	}
}

GetValidVicidialCID(cid ari.CallerID) (CIDType, string) {
	if ThreeWayTransferMatcher.FindString(cid.GetName()) != "" {
		return CIDTypeThreeWayTransfer, ThreeWayTransferMatcher.FindString(cid.GetName())
	} else if ManualDialsMatcher.FindString(cid.GetName()) != "" {
		return CIDTypeManualDials, ManualDialsMatcher.FindString(cid.GetName())
	} else if AutoDialsMatcher.FindString(cid.GetName()) != "" {
		return CIDTypeAutoDials, AutoDialsMatcher.FindString(cid.GetName())
	} else if InboundCallsMatcher.FindString(cid.GetName()) != "" {
		return CIDTypeInboundCalls, InboundCallsMatcher.FindString(cid.GetName())
	} else if RingagentMatcher.FindString(cid.GetName()) != "" {
		return CIDTypeRinagent, RingagentMatcher.FindString(cid.GetName())
	} else {
		return nil, nil
	}
}
