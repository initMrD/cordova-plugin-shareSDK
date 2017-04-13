//
//  CDVPluginDemo.h
//  IonicTest
//
//  Created by System Administrator on 2017/4/1.
//
//

#import <Cordova/CDVPlugin.h>

@interface CDVPluginDemo : CDVPlugin

- (void)nativeOnly:(CDVInvokedUrlCommand*)command;

@end
