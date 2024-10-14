package com.didichuxing.doraemonkit.kit.sysinfo

import android.app.Activity
import android.content.Context
import com.didichuxing.doraemonkit.R
import com.didichuxing.doraemonkit.kit.AbstractKit
import com.didichuxing.doraemonkit.util.DoKitSystemUtil
import com.google.auto.service.AutoService

/**
 * 进入开发者选项
 * Created by jint on 2018/6/22.
 */
@AutoService(AbstractKit::class)
class ServiceRunningKit : AbstractKit() {
    override val name: Int
        get() = R.string.dk_kit_service_running
    override val icon: Int
        get() = R.mipmap.dk_kit_s_runing

    override fun onClickWithReturn(activity: Activity): Boolean {
        DoKitSystemUtil.startServiceRunningActivity(activity)
        return true
    }

    override fun onAppInit(context: Context?) {}
    override val isInnerKit: Boolean
        get() = true

    override fun innerKitId(): String {
        return "dokit_sdk_comm_ck_develop"
    }
}