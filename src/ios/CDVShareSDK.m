//
//  CDVShareSDK.m
//
//  Created by initmrd on 2017/4/1.
//
//

#import "CDVShareSDK.h"
#import <Cordova/CDVPlugin.h>

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>

//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

//微信SDK头文件
#import "WXApi.h"

@implementation CDVShareSDK

- (void)init:(CDVInvokedUrlCommand*)command
{
    NSLog(@"进入init");
    NSString *mobAppKey = command.arguments[0];
    NSString *QQAppID = [[command.arguments[1] objectForKey:@"QQ"] objectForKey:@"AppID"];
    NSString *QQAppKey = [[command.arguments[1] objectForKey:@"QQ"] objectForKey:@"AppKey"];
    NSLog(@"%@,%@，%@",mobAppKey,QQAppID,QQAppKey);
    [ShareSDK registerApp:mobAppKey
          activePlatforms:@[
                            @(SSDKPlatformTypeWechat),
                            @(SSDKPlatformTypeQQ)]
                 onImport:^(SSDKPlatformType platformType)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 [ShareSDKConnector connectWeChat:[WXApi class]];
                 break;
             case SSDKPlatformTypeQQ:
                 [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                 break;
             default:
                 break;
         }
     }
          onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {

         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885"
                                       appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
                 break;
             case SSDKPlatformTypeQQ:
                 [appInfo SSDKSetupQQByAppId:QQAppID
                                      appKey:QQAppKey
                                    authType:SSDKAuthTypeBoth];
                 break;
             default:
                 break;
         }
     }];
}
- (void)otherLogin:(CDVInvokedUrlCommand*)command
{
    NSLog(@"进入otherLogin");
    NSString *callbackId = command.callbackId;
    NSString *loginTpye = command.arguments[0];
    NSLog(@"使用QQ第三方登陆%@",loginTpye);
    NSLog(@"callbackid==========%@",callbackId);
    if([loginTpye isEqualToString:@"QQ"]){
        [ShareSDK getUserInfo:SSDKPlatformTypeQQ onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            if(state == SSDKResponseStateSuccess){
                NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:user.uid, @"uid",
                                          user.credential.token, @"credentialToken",
                                          user.nickname, @"nickname",nil];
                NSLog(@"uid=%@",user.uid);
                NSLog(@"%@",user.credential);
                NSLog(@"token=%@",user.credential.token);
                NSLog(@"nickname=%@",user.nickname);
                CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:userInfo];

                [self.commandDelegate sendPluginResult:result callbackId:callbackId];
            }else{
                NSLog(@"%@",error);
            }
        }];

    }
};


@end
