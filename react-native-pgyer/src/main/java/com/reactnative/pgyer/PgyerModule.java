package com.reactnative.pgyer;

import android.text.TextUtils;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.pgyersdk.javabean.AppBean;
import com.pgyersdk.update.PgyUpdateManager;
import com.pgyersdk.update.UpdateManagerListener;


public class PgyerModule extends ReactContextBaseJavaModule {

    private AppBean appBean;

    public PgyerModule(ReactApplicationContext reactContext) {
        super(reactContext);
        updateVersion();
    }

    @Override
    public String getName() {
        return "RCTPgyerModule";
    }


    /**
     * 去服务器获得新版本信息
     */
    @ReactMethod
    public void updateVersion(){
        PgyUpdateManager.register(getCurrentActivity(),null,new UpdateManagerListener(){
            @Override
            public void onNoUpdateAvailable() {
                appBean= new AppBean();
            }

            @Override
            public void onUpdateAvailable(String result) {
                // 将新版本信息封装到AppBean中
                appBean = getAppBeanFromString(result);
            }
        });
    }

    /**
     * 如果需要提示请在调用前做出提示
     * 下载新版本
     */
    @ReactMethod
    public void download(){
        if (TextUtils.isEmpty(appBean.getVersionCode())){
            return;
        }
        UpdateManagerListener.startDownloadTask(getCurrentActivity(),appBean.getDownloadURL());
    }


    /**
     * 获得新版本号
     * @return
     */
    @ReactMethod
    public String getVersion(){
        return TextUtils.isEmpty(appBean.getVersionCode())?"":appBean.getVersionCode();
    }

}
