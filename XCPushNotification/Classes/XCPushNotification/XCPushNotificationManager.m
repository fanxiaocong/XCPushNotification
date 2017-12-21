//
//  XCPushNotificationManager.m
//  Pods-XCPushNotification_Example
//
//  Created by 樊小聪 on 2017/12/11.
//

#import "XCPushNotificationManager.h"


@implementation XCPushNotificationManager

static id _instance = nil;

+ (instancetype)sharePushNotificationManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}


+ (void)configurePushNotificationPlatformType:(XCPushNotificationPlatformType)platformType
                                       appKey:(NSString *)appKey
                                 isProduction:(BOOL)isProduction
{
    XCPushNotificationManager *mgr = [XCPushNotificationManager sharePushNotificationManager];
    
    switch (platformType)
    {
        case XCPushNotificationPlatformTypeJPush:   /// 极光推送
        {
            Class factoryClass = NSClassFromString(@"JPushNotificationFactory");
            mgr.pushFactory = [[factoryClass alloc] initWithAppKey:appKey isProduction:isProduction];
            break;
        }
    }
}

- (void)setPushFactory:(id<XCPushNotificationFactoryProtocol>)pushFactory
{
    _pushFactory = pushFactory;
}

@end
