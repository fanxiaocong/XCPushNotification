//
//  PushNotificationConfigureProtocol.h
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/2.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：通知与AppDelelgate相关的协议 🐾
 */

#import <UIKit/UIKit.h>

@protocol XCPushNotificationAppDelegateProtocol <NSObject>

@optional
/**
 *  程序启动
 */
- (void)application:(UIApplication *)app didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

/**
 *  注册远程推送
 */
- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;


/**
 *  收到远程推送
 */
- (void)application:(UIApplication *)app didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

- (void)application:(UIApplication *)app didReceiveRemoteNotification:(NSDictionary *)userInfo;


/**
 *  程序已经进入后台
 */
- (void)applicationDidEnterBackground:(UIApplication *)application;

/**
 *  程序即将进入前台
 */
- (void)applicationWillEnterForeground:(UIApplication *)application;

@end
