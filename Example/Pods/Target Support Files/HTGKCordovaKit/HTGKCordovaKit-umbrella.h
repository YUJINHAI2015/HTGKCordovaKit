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

#import "CDVBattery.h"
#import "CDVWKProcessPoolFactory.h"
#import "CDVWKWebViewEngine.h"
#import "CDVWKWebViewUIDelegate.h"

FOUNDATION_EXPORT double HTGKCordovaKitVersionNumber;
FOUNDATION_EXPORT const unsigned char HTGKCordovaKitVersionString[];

