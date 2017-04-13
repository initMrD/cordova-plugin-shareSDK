//
//  CDVPluginDemo.m
//  IonicTest
//
//  Created by System Administrator on 2017/4/1.
//
//

#import "CDVPluginDemo.h"
#import <Cordova/CDVPlugin.h>

@implementation CDVPluginDemo

- (void)nativeOnly:(CDVInvokedUrlCommand*)command
{
    NSLog(@"进入iOS");
}

@end
