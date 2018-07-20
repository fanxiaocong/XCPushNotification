//
//  XCPushNotificationProtocol.h
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/1.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：推送通知协议类 🐾
 */

#import <UIKit/UIKit.h>

@protocol XCPushNotificationProtocol

@required
/** 👀 收到远程通知的回调 👀 */
@property (copy, nonatomic) void(^didReceiveRemoteNotificationHandle)(UIApplication *app, NSDictionary *userInfo);

/**
 *  实例化推送对象
 *
 *  @param appKey           AppKey
 *  @param isProduction     是否是生产环境
 */
- (instancetype)initWithAppKey:(NSString *)appKey
                  isProduction:(BOOL)isProduction;

/**
 *  登录
 */
- (void)login:(NSString *)pushKey;
/**
 *  退出
 */
- (void)logout;

@end

