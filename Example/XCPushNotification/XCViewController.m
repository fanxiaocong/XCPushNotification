//
//  XCViewController.m
//  XCPushNotification
//
//  Created by fanxiaocong on 12/11/2017.
//  Copyright (c) 2017 fanxiaocong. All rights reserved.
//

#import "XCViewController.h"
#import <XCPushNotification/XCPushNotificationManager.h>


@interface XCViewController ()

@end


@implementation XCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /// 收到推送的回调
    id<XCPushNotificationFactoryProtocol> pushFactory = [XCPushNotificationManager sharePushNotificationManager].pushFactory;
    id<XCPushNotificationProtocol> push = pushFactory.pushNotification;
    push.didReceiveRemoteNotificationHandle = ^(UIApplication *app, NSDictionary *userInfo) {
        NSLog(@"收到了远程推送");
    };
}

- (IBAction)login:(id)sender
{
    /// 登录
    id<XCPushNotificationFactoryProtocol> pushFactory = [XCPushNotificationManager sharePushNotificationManager].pushFactory;
    id<XCPushNotificationProtocol> push = pushFactory.pushNotification;
    [push login:@"推送的唯一标识码"];
}

- (IBAction)logout:(id)sender
{
    /// 登出
    id<XCPushNotificationFactoryProtocol> pushFactory = [XCPushNotificationManager sharePushNotificationManager].pushFactory;
    id<XCPushNotificationProtocol> push = pushFactory.pushNotification;
    [push logout];
}

@end
