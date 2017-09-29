//
//  PushNotificationProtocol.h
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/1.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：推送通知协议类 🐾
 */

#import "XCPushNotificationAppDelegateProtocol.h"

@protocol XCPushNotificationProtocol <XCPushNotificationAppDelegateProtocol>

@optional
/** 👀 收到远程通知的回调 👀 */
@property (copy, nonatomic) void(^didReceiveRemoteNotificationHandle)(NSDictionary *userInfo);

@required
/**
 *  登录
 */
- (void)login:(NSString *)pushKey;
/**
 *  退出
 */
- (void)logout;

@end
