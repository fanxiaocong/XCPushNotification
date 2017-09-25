//
//  PushNotificationManager.m
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/2.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "XCPushNotificationManager.h"
#import "XCPushNotificationPlatformXMLParser.h"

@implementation XCPushNotificationManager

static id _instance = nil;

+ (instancetype)sharePushNotificationManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        XCPushNotificationPlatformXMLParser *parser = [[XCPushNotificationPlatformXMLParser alloc] init];
        XCPushNotificationPlatform *platform = parser.platfrom;
        
        Class factoryClass = NSClassFromString(platform.factoryName);
        
        _pushFactory = [[factoryClass alloc] initWithPlatform:platform];
    }
    
    return self;
}

@end
