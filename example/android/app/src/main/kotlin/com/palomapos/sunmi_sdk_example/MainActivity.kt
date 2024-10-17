package com.palomapos.sunmi_sdk_example

import android.content.Intent
import com.palomapos.sunmi_sdk.SunmiSdkPlugin
import io.flutter.embedding.android.FlutterActivity
import org.json.JSONObject


class MainActivity: FlutterActivity(




){
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        SunmiSdkPlugin().activityResult(requestCode, resultCode, data);
    }
}
