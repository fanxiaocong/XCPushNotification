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
    JPushNotification *_jpush;
}

#pragma mark - 📕 👀 PushNotificationFactoryProtocol 👀

- (instancetype)initWithAppKey:(NSString *)appKey
                  isProduction:(BOOL)isProduction
{
    if (self = [super init])
    {
        _jpush = [[JPushNotification alloc] initWithAppKey:appKey isProduction:isProduction];
    }
    
    return self;
}

- (id<XCPushNotificationProtocol>)pushNotification
{
    return _jpush;
}

@end
