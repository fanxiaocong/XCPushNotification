//
//  XCPushNotificationManager.h
//  Pods-XCPushNotification_Example
//
//  Created by 樊小聪 on 2017/12/11.
//

#import <Foundation/Foundation.h>

#import "XCPushNotificationFactoryProtocol.h"


/**
 *  第三方推送类型
 */
typedef NS_ENUM(NSInteger, XCPushNotificationPlatformType)
{
    /// 极光推送
    XCPushNotificationPlatformTypeJPush = 0
};


@interface XCPushNotificationManager : NSObject

/**
 *  返回具体推送通知的工厂实体
 */
@property (strong, nonatomic, readonly) id<XCPushNotificationFactoryProtocol> pushFactory;


/**
 *  配置推送平台相关的数据
 *
 *  @param platformType     第三方推送类型
 *  @param appKey           AppKey
 *  @param isProduction     是否是生产环境
 */
+ (void)configurePushNotificationPlatformType:(XCPushNotificationPlatformType)platformType
                                       appKey:(NSString *)appKey
                                 isProduction:(BOOL)isProduction;

+ (instancetype)sharePushNotificationManager;

@end
