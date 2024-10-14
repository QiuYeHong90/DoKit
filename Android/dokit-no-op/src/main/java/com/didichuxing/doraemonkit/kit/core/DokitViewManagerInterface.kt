package com.didichuxing.doraemonkit.kit.core

import android.app.Activity

/**
 * ================================================
 * 作    者：jint（金台）
 * 版    本：1.0
 * 创建日期：2019-09-28-15:18
 * 描    述：页面浮标管理类接口
 * 修订历史：
 * ================================================
 */
interface DokitViewManagerInterface {
    /**
     * 在当前Activity中添加指定悬浮窗
     *
     * @param dokitIntent
     */
    fun attach(dokitIntent: DokitIntent)

    /**
     * 移除每个activity指定的dokitView
     *
     * @param dokitView
     */
    fun detach(dokitView: AbsDokitView)


    /**
     * 移除每个activity指定的dokitView tag
     *
     * @param tag 一般为dokitView的className
     */
    fun detach(tag: String)


    fun detach(doKitViewClass: Class<out AbsDokitView>)


    /**
     * 移除所有activity的所有dokitView
     */
    fun detachAll()

    /**
     * 获取页面上指定的dokitView
     *
     * @param activity
     * @param tag
     * @return
     */
    fun <T:AbsDokitView> getDoKitView(activity: Activity?, clazz: Class<T>): AbsDokitView?


    /**
     * 获取页面上所有的dokitView
     *
     * @param activity
     * @return
     */
    fun getDoKitViews(activity: Activity?): Map<String, AbsDokitView>?

    /**
     * 当app进入后台时调用
     */
    fun notifyBackground()

    /**
     * 当app进入前台时调用
     */
    fun notifyForeground()

    /**
     * Activity销毁时调用
     *
     * @param activity
     */
    fun onActivityDestroyed(activity: Activity?)

    /**
     * 页面onPause时调用
     *
     * @param activity
     */
    fun onActivityPaused(activity: Activity?)

    /**
     * 页面onStop时调用
     */
    fun onActivityStopped(activity: Activity?)

    /**
     *
     * @param activity
     */
    fun dispatchOnActivityResumed(activity: Activity?)


}