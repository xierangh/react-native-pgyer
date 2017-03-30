//
//  RNPgyer.m
//  RNPgyer
//
//  Created by xinzhixu on 2017/3/29.
//  Copyright © 2017年 yanshisan. All rights reserved.
//

#import "RNPgyer.h"
#import <PgyUpdate/PgyUpdateManager.h>

@implementation PgyerModule


RCT_EXPORT_MODULE();
RCT_EXPORT_METHOD(bindAppId:(NSString* )appId){
    NSLog(@"PgyUpdateManager init");
    
    [[PgyUpdateManager sharedPgyManager] startManagerWithAppId:appId];
    
}

RCT_EXPORT_METHOD(updateVersion){
    NSLog(@"updateVersion");
    
    [[PgyUpdateManager sharedPgyManager] checkUpdate];
    
}
RCT_EXPORT_METHOD(updateVersionmore){
    [[PgyUpdateManager sharedPgyManager] checkUpdateWithDelegete:self selector:@selector(updateMethod:)];
}

-(void)updateMethod:(NSDictionary* )result{
    NSLog(@"result %@",result);
}

@end
