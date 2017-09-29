//
//  PushNotificationPlatformXMLParser.h
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/2.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：推送平台配置解析 🐾
 */

#import <Foundation/Foundation.h>
#import "XCPushNotificationPlatform.h"

@interface XCPushNotificationPlatformXMLParser : NSObject

/** 👀 推送平台配置模型 👀 */
@property (strong, nonatomic, readonly) XCPushNotificationPlatform *platfrom;

@end
