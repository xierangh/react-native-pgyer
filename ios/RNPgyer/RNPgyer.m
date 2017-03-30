//
//  RNPgyer.m
//  RNPgyer
//
//  Created by xinzhixu on 2017/3/29.
//  Copyright © 2017年 yanshisan. All rights reserved.
//

#import "RNPgyer.h"
#import <PgyUpdate/PgyUpdateManager.h>

@implementation RNPgyer

NSDictionary* result;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[PgyUpdateManager sharedPgyManager] startManagerWithAppId:@"64913afcd997d3485804cace997ddf32"];
    }
    return self;
}

RCT_EXPORT_MODULE();
RCT_EXPORT_METHOD(updateVersion(){
    
    [[PgyUpdateManager sharedPgyManager] checkUpdateWithDelegete:self selector:@selector(updateMethod:)];
})
RCT_EXPORT_METHOD(download(){
    [[UIApplication shareApplication] openURL:[NSURL URLWithString:response[@"downloadURL"]]];
    [[PgyUpdateManager sharedPgyManager] updateLocalBuildNumber];
})
RCT_EXPORT_METHOD((NSString *)getVersion(){
    if(self.result == nil){
        return "";
    }
    return self.result[@"versionCode"]
})

-(void)updateMethod((NSDictionary* result)){
    self.result = result;
}

@end
