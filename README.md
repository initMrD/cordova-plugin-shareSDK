# cordova-plugin-ShareSDK
### ShareSDK插件 主要针对第三方登陆这块内容,暂时只支持QQ
>iOS环境需要安装cocoapod
## 授权申请：
- Mob官网：http://www.mob.com/
- QQ开放平台：http://open.qq.com/
## 安装插件：
```
cordova plugin add /Users/mrd/Documents/github/cordova-plugin-shareSDK --variable MOB_APP_KEY=MOB申请的APPKEY --variable QQ_APP_ID_ANDROID=QQ开放平台申请的Android的AppID --variable QQ_APP_KEY_ANDROID=QQ开放平台申请的Android的AppKey --variable QQ_APP_ID_IOS=QQ开放平台申请的iOS的AppID --variable QQ_APP_KEY_IOS=QQ开放平台申请的iOS的AppKey 
```
### 例如
```
cordova plugin add /Users/mrd/Documents/github/cordova-plugin-shareSDK --variable MOB_APP_KEY=1cd68c2143e35 --variable QQ_APP_ID_ANDROID=1106092730 --variable QQ_APP_KEY_ANDROID=97YNpoJFo0xH5eLI --variable QQ_APP_ID_IOS=1106018997 --variable QQ_APP_KEY_IOS=i1tCJmiRPouSjhk7 
```

## 初始化插件（注意：某些平台的iOS和Android中的AppKey和AppID有区别）：
```
ShareSDK.init(mobAppkey,platformParam);
```
### 例如
```
    if(ionic.Platform.isIOS()){
        var platformParam = {
            QQ:{
                AppID:'1106018997',
                AppKey:'i1tCJmiRPouSjhk7'
            }
        }
        ShareSDK.init('1cd68c2143e35',platformParam);
    }else{
        var platformParam = {
            QQ:{
                AppID:'1106092730',
                AppKey:'97YNpoJFo0xH5eLI'
            }
        ShareSDK.init('1cd68c2143e35',platformParam);
        }
    }
```

## 使用第三方登陆：
```
ShareSDK.otherLogin(登陆类型,成功之后的回调);
```

### 例如
```
ShareSDK.otherLogin('QQ', function (data) {
                console.info(data);
            });
```

---

## 未来计划：
### 陆续添加微博和微信的第三放登陆和分享，主要看公司需求
