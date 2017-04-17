var exec = require('cordova/exec');

var ShareSDK = {
    init:function (appkey,platformParam,success,error) {
        exec(success,error,"ShareSDK","init", [appkey,platformParam]);
    },
    otherLogin:function (type,success,error) {
        exec(success,error,"ShareSDK","otherLogin", [type]);
    }

};

module.exports = ShareSDK;