//
//  PushNotification.m
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/1.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：推送通知实体类 🐾
 */

#import "JPushNotification.h"


#import <JPush/JPUSHService.h>
#import <XCMacros/XCMacros.h>


static NSString * const JPushChannel = @"Publish channel";


@implementation JPushNotification
{
    XCPushNotificationPlatform *_platform;
}

#pragma mark - 🔒 👀 Privite Method 👀

/**
 *  极光的登录、登出操作
 *
 *  @param alias 提交推送唯一标示符(传 @"" 表示退出极光操作)
 */
- (void)setJPushAlias:(NSString *)alias
{
    DLog(@"alias:  %@", alias);
    
    // 提交推送唯一标示符
BeginIgnoreDeprecatedWarning
    [JPUSHService setTags:nil alias:alias fetchCompletionHandle:^(int iResCode, NSSet *iTags, NSString *iAlias) {
        
        DLog(@"iResCode = %d, alias = %@", iResCode, alias);
        
        // 操作失败，则继续操作
        if (iResCode)
        {
            DLog(@"************************极光操作失败************************");
            [self setJPushAlias:alias];
        }
        else    // 操作成功
        {
            DLog(@"************************极光操作成功************************");
            return;
        }
    }];
EndIgnoreDeprecatedWarning
}

#pragma mark - 📕 👀 XCPushNotificationAppDelegateProtocol 👀

- (instancetype)initWithPlatform:(XCPushNotificationPlatform *)platform
{
    if (self = [super init])
    {
        _platform = platform;
    }
    
    return self;
}


#pragma mark - 📕 👀 XCPushNotificationProtocol 👀

/**
 *  登录
 */
- (void)login:(NSString *)pushKey
{
    [self setJPushAlias:pushKey];
}

/**
 *  登出
 */
- (void)logout
{
    [self setJPushAlias:@""];
}

#pragma mark - 👀 AppDelegate 相关方法 👀 💤

/**
 *  程序启动
 */
- (void)application:(UIApplication *)app didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)
    {
BeginIgnoreDeprecatedWarning
        //可以添加自定义categories
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                          UIUserNotificationTypeSound |
                                                          UIUserNotificationTypeAlert)
                                              categories:nil];
EndIgnoreDeprecatedWarning
    }
    
    //Required
    // init Push(2.1.5版本的SDK新增的注册方法，改成可上报IDFA，如果没有使用IDFA直接传nil  )
    // 如需继续使用pushConfig.plist文件声明appKey等配置内容，请依旧使用[JPUSHService setupWithOption:launchOptions]方式初始化。
    [JPUSHService setupWithOption:launchOptions
                           appKey:_platform.appKey
                          channel:JPushChannel
                 apsForProduction:_platform.isProduction
            advertisingIdentifier:nil];
    
    if (launchOptions)
    {
        NSDictionary * userInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        //这个判断是在程序没有运行的情况下收到通知，点击通知跳转页面
        if (userInfo)
        {
            DLog(@"推送消息==== %@",userInfo);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                // app 启动
                // 发送通知，进行页面跳转
                if (self.didReceiveRemoteNotificationHandle)
                {
                    self.didReceiveRemoteNotificationHandle(userInfo);
                }
            });
        }
    }
}

/**
 *  注册远程推送
 */
- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}


/**
 *  收到远程推送
 */
- (void)application:(UIApplication *)app didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    DLog(@"推送信息 ----%@", userInfo);
    
    // 如果 app 在前台，则直接返回
    if (app.applicationState == UIApplicationStateActive)       return;
    
    /**  极光推送*/
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
    
    // 发送通知
    if (self.didReceiveRemoteNotificationHandle)
    {
        self.didReceiveRemoteNotificationHandle(userInfo);
    }
}

- (void)application:(UIApplication *)app didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    DLog(@"userInfo:   %@", userInfo);
    
    // 取得 APNs 标准信息内容
    // 如果 app 在前台，则直接返回
    if (app.applicationState == UIApplicationStateActive)       return;
    
    // iOS 10 以下 Required
    [JPUSHService handleRemoteNotification:userInfo];
    
    // 发送通知
    if (self.didReceiveRemoteNotificationHandle)
    {
        self.didReceiveRemoteNotificationHandle(userInfo);
    }
}


/**
 *  程序已经进入后台
 */
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [JPUSHService resetBadge];
}

/**
 *  程序即将进入前台
 */
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [application setApplicationIconBadgeNumber:0];
    [JPUSHService resetBadge];
    
BeginIgnoreDeprecatedWarning
    [application cancelAllLocalNotifications];
EndIgnoreDeprecatedWarning
}


@end
