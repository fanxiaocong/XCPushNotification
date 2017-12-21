#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "XCPushNotificationAppDelegate.h"
#import "XCPushNotificationManager.h"
#import "XCPushNotificationAppDelegateProtocol.h"
#import "XCPushNotificationFactoryProtocol.h"
#import "XCPushNotificationProtocol.h"

FOUNDATION_EXPORT double XCPushNotificationVersionNumber;
FOUNDATION_EXPORT const unsigned char XCPushNotificationVersionString[];

