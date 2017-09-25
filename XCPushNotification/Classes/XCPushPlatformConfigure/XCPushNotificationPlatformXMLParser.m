//
//  PushNotificationPlatformXMLParser.m
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/2.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

/*
 *  备注：推送平台配置解析 🐾
 */

#import "XCPushNotificationPlatformXMLParser.h"


@interface XCPushNotificationPlatformXMLParser ()<NSXMLParserDelegate>

@property (strong, nonatomic) NSMutableArray *parsers;

@end


@implementation XCPushNotificationPlatformXMLParser

- (instancetype)init
{
    if (self = [super init])
    {
        /// 设置解析
        [self setupParser];
    }
    
    return self;
}

/**
 *  设置解析
 */
- (void)setupParser
{
    self.parsers = [NSMutableArray array];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"XCPushNotificationConfigure" ofType:@"xml"];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:fileURL];
    parser.delegate = self;
    [parser parse];
}

#pragma mark - 👀 Getter Method 👀 💤

- (XCPushNotificationPlatform *)platfrom
{
    if (!self.parsers.count)    return NULL;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isOpen == %zi", YES];
    return [[self.parsers filteredArrayUsingPredicate:predicate] firstObject];
}

#pragma mark - 💉 👀 NSXMLParserDelegate 👀

/**
 *  开始解析
 */
- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    //解析xml
    if([elementName isEqualToString:@"platform"])
    {
        XCPushNotificationPlatform *platform = [[XCPushNotificationPlatform alloc] init];
        
        platform.Id           = attributeDict[@"id"];
        platform.appKey       = attributeDict[@"appKey"];
        platform.factoryName  = attributeDict[@"factoryName"];
        platform.isProduction = [attributeDict[@"isProduction"] boolValue];
        platform.isOpen       = [attributeDict[@"isOpen"] boolValue];

        //保存
        [self.parsers addObject:platform];
    }
}

@end
