//
//  PushNotificationManager.h
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/2.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：通知管理类 🐾
 */

#import <Foundation/Foundation.h>
#import "XCPushNotificationFactoryProtocol.h"

@interface XCPushNotificationManager : NSObject

+ (instancetype)sharePushNotificationManager;

/**
 *  返回具体推送通知的工厂实体
 */
@property (strong, nonatomic, readonly) id<XCPushNotificationFactoryProtocol> pushFactory;

@end
