//
//  PushNotificationFactoryProtocol.h
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/1.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：推送通知工厂协议类 🐾
 */

#import "XCPushNotificationProtocol.h"

@protocol XCPushNotificationFactoryProtocol <NSObject>

@required
@property (weak, nonatomic, readonly) id<XCPushNotificationProtocol> pushNotification;

- (instancetype)initWithPlatform:(XCPushNotificationPlatform *)platform;

@end
