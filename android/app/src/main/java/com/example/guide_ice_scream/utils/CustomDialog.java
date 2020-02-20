package com.example.guide_ice_scream.utils;

import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import com.example.guide_ice_scream.R;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.AdView;
import com.google.android.material.button.MaterialButton;

public class CustomDialog {
    Activity activity;
    FrameLayout frameLayout;
    TextView txtLable, txtContent;
    Button btnOk, btnHuy;
    AlertDialog alertDialog;
    ButtonOkClickListener buttonOkClickListener;

    public void setButtonOkClickListener(ButtonOkClickListener buttonOkClickListener) {
        this.buttonOkClickListener = buttonOkClickListener;
    }

    public CustomDialog(@NonNull Activity activity) {
        AlertDialog.Builder builder = new AlertDialog.Builder(activity);
        ViewGroup viewGroup = activity.findViewById(android.R.id.content);
        View dialogView = LayoutInflater.from(activity).inflate(R.layout.dialog_back, viewGroup, false);
        frameLayout = dialogView.findViewById(R.id.frameAds);
        txtLable = dialogView.findViewById(R.id.txtDialogLable);
        txtContent = dialogView.findViewById(R.id.txtDialogCotent);
        btnHuy = dialogView.findViewById(R.id.btnHuy);
        btnOk = dialogView.findViewById(R.id.btnThoat);
        btnOk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(buttonOkClickListener!= null ) buttonOkClickListener.onClick();
            }
        });
        btnHuy.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                alertDialog.dismiss();
            }
        });
        builder.setView(dialogView);
        alertDialog = builder.create();
        alertDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.WHITE));
    }

    public void setLable(String lable) {
        txtLable.setText(lable);
    }

    public void setContent(String content) {
        txtContent.setText(content);
    }

    public void setBannerAds(Activity activity,  String bannerID) {
        AdView adView = new AdView(activity);
        adView.setAdSize(AdSize.MEDIUM_RECTANGLE);
        adView.setAdUnitId(bannerID);

        AdRequest adRequest = new AdRequest.Builder().build();
        adView.loadAd(adRequest);
        if (frameLayout != null)
            frameLayout.removeAllViews();
        frameLayout.addView(adView);
    }

    public void setNativeAds(Activity activity, int layout) {
        UnifiedNativeAdsUtils.getInstance(activity).setNativeAds(frameLayout, layout, new AdListener() {
            @Override
            public void onAdFailedToLoad(int i) {
                super.onAdFailedToLoad(i);
            }

            @Override
            public void onAdLoaded() {
                super.onAdLoaded();
            }
        });
    }

    public void show() {
        alertDialog.show();
    }
    public interface ButtonOkClickListener{
        void onClick();
    }
}
