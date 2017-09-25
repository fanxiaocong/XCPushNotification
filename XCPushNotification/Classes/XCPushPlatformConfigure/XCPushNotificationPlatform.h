//
//  PushNotificationPlatform.h
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/2.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：推送平台设置 🐾
 */

#import <Foundation/Foundation.h>

@interface XCPushNotificationPlatform : NSObject

/** 👀 平台 ID 👀 */
@property (copy, nonatomic) NSString *Id;
/** 👀 AppKey 👀 */
@property (copy, nonatomic) NSString *appKey;
/** 👀 工厂名称 👀 */
@property (copy, nonatomic) NSString *factoryName;
/** 👀 是否是生产环境 👀 */
@property (assign, nonatomic) BOOL isProduction;
/** 👀 是否开启 👀 */
@property (assign, nonatomic) BOOL isOpen;

@end
