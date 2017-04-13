package com.initmrd.cordova.plugin.ShareSDK;

import android.util.Log;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

import java.util.HashMap;

import cn.sharesdk.framework.Platform;
import cn.sharesdk.framework.PlatformActionListener;
import cn.sharesdk.tencent.qq.QQ;

/**
 * Created by initMrd@gmail.com on 2017/4/1.
 */

public class ShareSDK extends CordovaPlugin {
    private static final String TAG = "ShareSDK";
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if(action.equals("init")){
            Log.d(TAG,"init");
            cn.sharesdk.framework.ShareSDK.initSDK(cordova.getActivity());
        }
        if (action.equals("otherLogin")){
            Log.d(TAG,"otherLogin");
            if (args.get(0).equals("QQ")){
                Platform QQPlatform= cn.sharesdk.framework.ShareSDK.getPlatform(cordova.getActivity(), QQ.NAME);
                QQPlatform.setPlatformActionListener(new PlatformActionListener() {
                    @Override
                    public void onComplete(Platform platform, int i, HashMap<String, Object> hashMap) {
                        Log.d(TAG,"登录成功");
                    }

                    @Override
                    public void onError(Platform platform, int i, Throwable throwable) {
                        Log.d(TAG,"登录失败");
                    }

                    @Override
                    public void onCancel(Platform platform, int i) {
                        Log.d(TAG,"取消登陆");
                    }
                });
                QQPlatform.authorize();
            }

        }
        return false;
    }
}
