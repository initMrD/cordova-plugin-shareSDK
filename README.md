# cordova-plugin-ShareSDK
ShareSDK插件
## 安装插件:
```
cordova plugin add /private/var/root/Documents/github/cordova-plugin-shareSDK --variable MOB_APP_KEY=MOB申请的APPKEY --variable QQ_APP_ID=QQ开放平台申请的APPID --variable QQ_APP_KEY=QQ开放平台申请的APPKEY
```
### 例如
```
cordova plugin add /private/var/root/Documents/github/cordova-plugin-shareSDK --variable MOB_APP_KEY=1cd68c2143e35 --variable QQ_APP_ID=1106092730 --variable QQ_APP_KEY=97YNpoJFo0xH5eLI
```

## 初始化插件
```
ShareSDK.init();
```

## 使用QQ登陆
```
ShareSDK.otherLogin('QQ');
```
