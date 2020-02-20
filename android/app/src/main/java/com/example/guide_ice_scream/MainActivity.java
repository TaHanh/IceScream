package com.example.guide_ice_scream;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.util.Log;

import com.example.guide_ice_scream.utils.CustomDialog;
import com.example.ratedialog.RatingDialog;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity implements RatingDialog.RatingDialogInterFace {
    private static final String CHANNEL = "guide_module";
    CustomDialog customDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        customDialog = new CustomDialog(this);
        customDialog.setNativeAds(this, R.layout.ad_unified_dialog);
        customDialog.setContent("Are you sure want to exit?");
        customDialog.setLable("Exit app");

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {

                        switch (call.method) {
                            case "change":
                                break;
                            case "openAnotherApp":
                                open(call.argument("data"), result);
                                break;
                            case "rateAuto":
                                rateAuto();
                                break;
                            case "rateManual":
                                rateManual();
                                break;
                            case "goToMarket":
                                goToMarket();
                                break;
                            case "getAppId":
                                result.success(getPackageName());
                                break;
                            case "moveToNewApp":
                                moveToNewApp(call.argument("newAppId"));
                                break;
                            case "showDialogBack": {
                                customDialog.show();
                                break;
                            }
                        }
                    }
                });
        rateAuto();
    }

    void moveToNewApp(String appId) {
        Intent intent = new Intent(new Intent(Intent.ACTION_VIEW,
                Uri.parse("http://play.google.com/store/apps/details?id=" + appId)));
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        startActivity(intent);

    }

    void open(String magnet, MethodChannel.Result result) {

        Intent browserIntent = new Intent(Intent.ACTION_VIEW);
        browserIntent.setData(Uri.parse(magnet));

        try {
            startActivity(browserIntent);
            result.success(true);

        } catch (ActivityNotFoundException ex) {
            Log.d("dddddd", "abcd");

            result.success(false);
        }
    }

    void goToMarket() {
        Intent goToMarket = new Intent(Intent.ACTION_VIEW).setData(Uri.parse("market://search?q=torrent clients"));
        startActivity(goToMarket);
    }

    public static void rateApp(Context context) {
        Intent intent = new Intent(new Intent(Intent.ACTION_VIEW,
                Uri.parse("http://play.google.com/store/apps/details?id=" + context.getPackageName())));
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);

        context.startActivity(intent);


    }

    public void rateAuto() {
        int rate = SharedPrefsUtils.getInstance(this).getInt("rate");
        if (rate < 1) {
            RatingDialog ratingDialog = new RatingDialog(this);
            ratingDialog.setRatingDialogListener(this);
            ratingDialog.showDialog();
            SharedPrefsUtils.getInstance(this).putInt("rate", 5);
        }

    }

    void rateManual() {
        RatingDialog ratingDialog = new RatingDialog(this);
        ratingDialog.setRatingDialogListener(this);
        ratingDialog.showDialog();
    }

    @Override
    public void onDismiss() {
    }

    @Override
    public void onSubmit(float rating) {
        if (rating > 3) {
            rateApp(this);
            SharedPrefsUtils.getInstance(this).putInt("rate", 5);
        }
    }

    @Override
    public void onRatingChanged(float rating) {
    }

}

class SharedPrefsUtils {
    Context activity;
    private SharedPreferences pref;
    private static SharedPrefsUtils utility;
    private SharedPreferences.Editor editor;
    private boolean autoCommit = true;

    public static SharedPrefsUtils getInstance(Context context) {
        if (utility == null) {
            utility = new SharedPrefsUtils(context.getApplicationContext());
        }
        return utility;
    }

    private SharedPrefsUtils(Context activity, int mode) {
        this.autoCommit = true;
        this.activity = activity;
        pref = activity.getSharedPreferences(activity.getPackageName() + "_preferences", mode);
        editor = pref.edit();

    }

    private SharedPrefsUtils(Context activity) {
        this.autoCommit = true;
        this.activity = activity;
        pref = activity.getSharedPreferences(activity.getPackageName() + "_preferences", Context.MODE_PRIVATE);
        editor = pref.edit();
    }

    private SharedPrefsUtils(Activity activity, boolean autoCommit) {
        this.autoCommit = autoCommit;
        this.activity = activity;
        pref = PreferenceManager.getDefaultSharedPreferences(activity);
        editor = pref.edit();
    }

    public void removeValue(String key) {
        editor.remove(key);
        if (autoCommit) commit();
    }

    public void putString(String key, String value) {
        editor.putString(key, value);
        if (autoCommit) {
            commit();
        }
    }

    public String getString(String key) {
        String defaultValue = "";
        return pref.getString(key, defaultValue);
    }

    public void putInt(String key, int value) {
        editor.putInt(key, value);
        if (autoCommit) {
            commit();
        }
    }

    public int getInt(String key) {
        int defaultValue = 0;
        return pref.getInt(key, defaultValue);
    }

    public void putLong(String key, long value) {
        editor.putLong(key, value);
        if (autoCommit) {
            commit();
        }
    }

    public long getLong(String key) {
        long defaultValue = 0;
        return pref.getLong(key, defaultValue);
    }

    public void commit() {
        editor.commit();
    }

    public boolean getBoolean(String key) {
        boolean defaultValue = false;
        return pref.getBoolean(key, defaultValue);
    }

    public void putBoolean(String key, boolean value) {
        editor.putBoolean(key, value);
        if (autoCommit) {
            commit();
        }
    }

    public void putDouble(String key, double value) {
        editor.putString(key, String.valueOf(value));
        if (autoCommit) {
            commit();
        }
    }

    public double getDouble(String key) {
        double value = 0;
        String valueStr = pref.getString(key, "0");
        if (valueStr != null) {
            value = Double.valueOf(valueStr);
        }
        return value;
    }

    public boolean isAutoCommit() {
        return autoCommit;
    }

    public void setAutoCommit(boolean autoCommit) {
        this.autoCommit = autoCommit;
    }

    public boolean containsKey(String key) {
        return pref.contains(key);
    }

    private SharedPrefsUtils() {
    }
}