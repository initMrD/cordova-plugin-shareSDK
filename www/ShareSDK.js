var exec = require('cordova/exec');

var ShareSDK = {
    init:function (success,error) {
        exec(success,error,"ShareSDK","init", []);
    },
    otherLogin:function (type,success,error) {
        exec(success,error,"ShareSDK","otherLogin", [type]);
    }

};

module.exports = ShareSDK;