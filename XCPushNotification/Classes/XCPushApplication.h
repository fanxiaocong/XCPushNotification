//
//  PushApplication.h
//  XCNotificationExample
//
//  Created by 樊小聪 on 2017/9/23.
//  Copyright © 2017年 樊小聪. All rights reserved.
//



/*
 *  备注：处理与AppDelegate相关的设置 🐾
 */



#import <UIKit/UIKit.h>

@interface XCPushApplication : NSObject

/**
 *  程序启动
 */
+ (void)application:(UIApplication *)app didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

/**
 *  注册远程推送
 */
+ (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;


/**
 *  收到远程推送
 */
+ (void)application:(UIApplication *)app didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

+ (void)application:(UIApplication *)app didReceiveRemoteNotification:(NSDictionary *)userInfo;


/**
 *  程序已经进入后台
 */
+ (void)applicationDidEnterBackground:(UIApplication *)application;

/**
 *  程序即将进入前台
 */
+ (void)applicationWillEnterForeground:(UIApplication *)application;

@end
