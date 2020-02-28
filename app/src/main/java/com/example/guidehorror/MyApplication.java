package com.example.guidehorror;

import android.app.Application;

import com.facebook.ads.AudienceNetworkAds;
import com.flurry.android.FlurryAgent;
import com.nzmsqftk.adx.service.AdsExchange;

public class MyApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        new FlurryAgent.Builder()
                .withLogEnabled(true)
                .build(this, "BT4HF4Q2SP9KBRK3GF22");


        AudienceNetworkAds.initialize(this);
        AdsExchange.init(this, "5e4f6f1b28b7931c597ca83e");
    }
}
