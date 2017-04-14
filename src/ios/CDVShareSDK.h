//
//  CDVShareSDK.h
//
//  Created by initmrd on 2017/4/1.
//
//

#import <Cordova/CDVPlugin.h>

@interface CDVShareSDK : CDVPlugin

- (void)init:(CDVInvokedUrlCommand*)command;
- (void)otherLogin:(CDVInvokedUrlCommand*)command;

@end
