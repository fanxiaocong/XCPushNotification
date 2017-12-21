//
//  XCPushNotificationAppDelegate.h
//  Pods-XCPushNotification_Example
//
//  Created by 樊小聪 on 2017/12/11.
//


/*
 *  备注：处理与 AppDelegate 相关的配置 🐾
 */

#import <UIKit/UIKit.h>

@interface XCPushNotificationAppDelegate : NSObject

/**
 *  程序启动
 */
+ (void)pushApplication:(UIApplication *)app didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

/**
 *  注册远程推送
 */
+ (void)pushApplication:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;


/**
 *  收到远程推送
 */
+ (void)pushApplication:(UIApplication *)app didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

+ (void)pushApplication:(UIApplication *)app didReceiveRemoteNotification:(NSDictionary *)userInfo;


/**
 *  程序已经进入后台
 */
+ (void)pushApplicationDidEnterBackground:(UIApplication *)application;

/**
 *  程序即将进入前台
 */
+ (void)pushApplicationWillEnterForeground:(UIApplication *)application;

@end
