package com.initmrd.cordova.plugin;

import android.util.Log;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

/**
 * Created by initMrd@gmail.com on 2017/4/1.
 */

public class PluginDemo extends CordovaPlugin {
    private static final String TAG = "PluginDemo";
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if(action.equals("nativeOnly")){
            Log.d(TAG,"成功进入android");
        }
        return false;
    }
}
