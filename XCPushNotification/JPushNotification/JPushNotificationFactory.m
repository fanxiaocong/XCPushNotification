//
//  JPushNotificationFactory.m
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/2.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：极光推送工厂类 🐾
 */

#import "JPushNotificationFactory.h"
#import "JPushNotification.h"

@implementation JPushNotificationFactory
{
    XCPushNotificationPlatform *_platform;
}

#pragma mark - 📕 👀 PushNotificationFactoryProtocol 👀

- (instancetype)initWithPlatform:(XCPushNotificationPlatform *)platform
{
    if (self = [super init])
    {
        _platform = platform;
    }
    
    return self;
}

- (id<XCPushNotificationProtocol>)pushNotification
{
    return [[JPushNotification alloc] initWithPlatform:_platform];
}

@end
