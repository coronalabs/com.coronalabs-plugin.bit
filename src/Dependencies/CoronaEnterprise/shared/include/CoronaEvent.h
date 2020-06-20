// ----------------------------------------------------------------------------
// 
// CoronaEvent.h
// Copyright (c) 2012 Corona Labs Inc. All rights reserved.
// 
// ----------------------------------------------------------------------------

#ifndef _CoronaEvent_H__
#define _CoronaEvent_H__

#include "CoronaMacros.h"

// Generic property keys
// ----------------------------------------------------------------------------

// String: 'event.name'
CORONA_API const char *CoronaEventNameKey() CORONA_PUBLIC_SUFFIX;

// String: 'event.provider'
CORONA_API const char *CoronaEventProviderKey() CORONA_PUBLIC_SUFFIX;

// String: 'event.phase'
CORONA_API const char *CoronaEventPhaseKey() CORONA_PUBLIC_SUFFIX;

// String: 'event.type'
CORONA_API const char *CoronaEventTypeKey() CORONA_PUBLIC_SUFFIX;

// String: 'event.response'
CORONA_API const char *CoronaEventResponseKey() CORONA_PUBLIC_SUFFIX;

// Boolean: 'event.isError'
CORONA_API const char *CoronaEventIsErrorKey() CORONA_PUBLIC_SUFFIX;

// Number: 'event.errorCode'
CORONA_API const char *CoronaEventErrorCodeKey() CORONA_PUBLIC_SUFFIX;


// Event types for library providers
// ----------------------------------------------------------------------------

// For "ads" providers
CORONA_API const char *CoronaEventAdsRequestName() CORONA_PUBLIC_SUFFIX;

// For "gameNetwork" providers
CORONA_API const char *CoronaEventGameNetworkName() CORONA_PUBLIC_SUFFIX;

// For "native.popup" providers
CORONA_API const char *CoronaEventPopupName() CORONA_PUBLIC_SUFFIX;

// ----------------------------------------------------------------------------

#endif // _CoronaEvent_H__
