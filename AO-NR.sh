#!/bin/sh

# Created By Atsa

# Sources: Android Developer, ANGLE for Android, XDA Discussion Community , Google Developer 
# Code From: Bang levv, Brainless, Chermodzs, Rextion, Sukitoo , Kazuyoo

# This Project is Currently Being Maintenance 
# Remember this Project isn't(Is Not)Being tested fully
# And this script all from trusted people and sources but any command has a chance to make your device system error
# Not Every Device Support all these cmd,prop,global/secure/system table settings 

# Brainless
 # Ensure a game package argument is provided
  if [ -z "$1" ]; then
    echo "Game package name is required as an argument."
    exit 1
  fi

# Get the full package name of the game
game=$(pm list packages | grep -i "$1" | sed 's/package://g')
 if [ -z "$game" ]; then
    echo "No matching package found for '$1'."
    exit 1
fi

# Get the main activity ID of the game
id=$(dumpsys package "$game" | grep -A 1 "MAIN" | grep "$game/" | awk '{print $2}' | sed 's/[0-9]*$//' | xargs)
 if [ -z "$id" ]; then
    echo "Failed to retrieve the main activity ID for '$game'."
    exit 1
 fi

sync

echo "AO-NR - Android System Optimization Settings For Non-Rooted"
echo "Development Version: 2.0 (Experimental)"
echo "Developer: Atsaei"
echo "-----------------------------------"
echo ""
sleep 1
android_ver=$(getprop ro.system.build.version.release | cut -d'.' -f1)
echo "Checking Android version"
 if [ "$android_ver" -lt 11 ]; then
 echo "Android version below 11, exiting"
      exit 1
   else
      echo "Android version compatible."
fi

# Android Developer, Bang Levv, XDA Community, Google Dev.
 # Android Properties
echo "  -Set Up Android Properties."
Androidproperties() {
setprop debug.hwui.renderer skiavk
setprop debug.hwui.capture_skp_enabled false
setprop debug.hwui.skia_atrace_enabled false
setprop debug.hwui.capture_skp_frames 60
setprop debug.hwui.render_ahead true
setprop debug.rs.max-threads 8
setprop debug.gr.swapinterval 1
setprop debug.egl.swapinterval 1
setprop debug.hwui.fps_divisor -1
setprop debug.rs.default-CPU-driver 1
setprop debug.sf.enable_hwc_vds 1
setprop debug.cpurend.vsync false
setprop debug.gralloc.disable_ubwc 0
setprop debug.stagefright.c2inputsurface -1
setprop debug.stagefright.ccodec 4 
setprop debug.stagefright.c2-poolmask 1507328
setprop debug.gfx.driver 1
setprop log.tag S
setprop log.tag.C2K_AT S
setprop log.tag.C2K_ATConfig S
setprop log.tag.C2K_RILC S
setprop log.tag.DCT S
setprop log.tag.LIBC2K_RIL S
setprop log.tag.PowerHalAddressUitls S
setprop log.tag.PowerHalMgrImpl S
setprop log.tag.PowerHalMgrServiceImpl S
setprop log.tag.PowerHalWifiMonitor S
setprop log.tag.UxUtility S
setprop log.tag.libPowerHal S
setprop log.tag.mipc_lib S
setprop log.tag.mtkpower@impl S
setprop log.tag.mtkpower_client S
setprop log.tag.trm_lib S
setprop debug.mediatek.appgamepq_compress 1
setprop debug.mediatek.disp_decompress 1
setprop debug.mediatek.high_frame_rate_sf_set_big_core_fps_threshold 60
setprop debug.sf.enable_adpf_cpu_hint true
setprop debug.hwui.use_hint_manager true
setprop debug.sf.use_phase_offsets_as_durations 1
setprop debug.sf.treat_170m_as_sRGB 1
setprop debug.sf.hwc_hotplug_error_via_neg_vsync 1
setprop debug.sf.hwc_hdcp_via_neg_vsync 1
setprop debug.slsi_platform 1
setprop debug.hwc.winupdate 1
setprop debug.sf.enable_sdr_dimming 1
setprop debug.sf.dim_in_gamma_in_enhanced_screenshots 1
setprop debug.c2.use_dmabufheaps 1
setprop log.tag.QFP 3
setprop log.tag.FOO_TAG SUPPRESS
setprop debug.sf.hw 1
setprop debug.sf.early.app.duration 500000
setprop debug.sf.late.app.duration 500000
setprop debug.sf.early.sf.duration 500000
setprop debug.sf.late.sf.duration 500000
setprop debug.sf.enable_hwc_vds 1               
setprop debug.sf.set_idle_timer_ms 100
setprop debug.sf.latch_unsignaled 1
setprop debug.sf.high_fps_early_app_phase_offset_ns -2000000
setprop debug.sf.high_fps_late_app_phase_offset_ns 500000
setprop debug.sf.high_fps_early_sf_phase_offset_ns -2000000
setprop debug.sf.high_fps_late_sf_phase_offset_ns 500000
setprop debug.sf.enable_advanced_sf_phase_offset 1
setprop debug.sf.disable_client_composition_cache 0
setprop debug.sf.enable_gl_backpressure 0
setprop debug.sf.disable_backpressure 1
setprop debug.sf.frame_rate_multiple_threshold 60
setprop debug.sf.layer_caching_active_layer_timeout_ms 1000
setprop debug.sf.enable_adpf_cpu_hint true
setprop debug.sf.use_phase_offsets_as_durations 1
setprop debug.renderengine.backend threaded
setprop debug.gralloc.enable_fb_ubwc 1
setprop debug.overlayui.enable 1
setprop debug.enabletr true
setprop debug.performance.tuning 1
setprop debug.qc.hardware true
setprop debug.egl.profiler 1
setprop debug.qctwa.statusbar 1
setprop debug.hwui.level true
setprop debug.composition.type mdp
setprop debug.hwui.show_layers_updates false
setprop debug.hwui.overdraw false
setprop debug.hwui.show_dirty_regions false
setprop debug.hwui.profile false
setprop debug.hwui.skip_empty_damage false
setprop debug.hwui.use_buffer_age true
setprop debug.hwui.use_partial_updates true
setprop debug.hwui.filter_test_overhead true
setprop debug.hwui.use_gpu_pixel_buffers true
setprop debug.sf.cpupolicy.base_min_bl 400          
setprop debug.sf.cpupolicy.boost_idle_bl 1          
setprop debug.sf.cpupolicy.hw_comp_suspend 0
setprop debug.sf.cpupolicy.hw_hfr_suspend 0
setprop debug.sf.cpupolicy.log 1
setprop debug.sf.cpupolicy.lowbound_uclamp_min 180
setprop debug.sf.cpupolicy.max_correct_offset 200
setprop debug.sf.cpupolicy.min_120 180
setprop debug.sf.cpupolicy.min_30_mml 160
setprop debug.sf.cpupolicy.min_60 150
setprop debug.sf.cpupolicy.min_60_mml 180
setprop debug.sf.cpupolicy.min_90 180
setprop debug.sf.cpupolicy.min_boost 180
setprop debug.sf.cpupolicy.power_down_120 800000
setprop debug.sf.cpupolicy.power_up_120 -100000
setprop debug.sf.cpupolicy.re_hfr 1
setprop debug.sf.cpupolicy.rt_bl_min 350
setprop debug.sf.cpupolicy.sf_cpu_thres 260
setprop debug.sf.cpupolicy.upbound_uclamp_max_ll 250
setprop debug.sf.cpupolicy.upbound_uclamp_min 450
setprop debug.sf.cpupolicy.upbound_uclamp_ret_sys 200
setprop debug.sf.cpupolicy.xgf_min 35
}
Androidproperties 
sleep 2

# Cmd Settings (Depending on Your Device it might cause some trouble)
 Cmd() {
    cmd thermalservice override-status 0
      cmd power set-adaptive-power-saver-enabled true
      cmd power set-fixed-performance-mode-enabled true
      cmd power set-mode 0
      cmd autofill set log_level off
      cmd activity memory-factor set CRITICAL
}
Cmd 
sleep 2

# ANGLE For Android 
 #Angle Set up Settings (Some devices Doesn't have build-in angle driver so you should download from repository)
echo "  --Set up Angle Rendering"
 angle() {
    setprop debug.angle.backend vulkan
      setprop debug.gles.angle 1
      settings put global angle_gl_driver_all_angle 0
      settings put global angle_gl_driver_selection_values angle
      settings put global angle_enabled_app $game
      settings put global angle_debug_package org.chromium.angle
      settings put global angle_gl_driver_selection_pkgs $game
      setprop debug.angle.backend 2
      setprop debug.angle.rules /data/local/tmp/a4a_rules.json
      setprop debug.angle.libs.suffix angle_in_apk
}
angle 
sleep 2

# Optimizing Game
echo "  --Optimizing Game"
 Optimizegame() {
   device_config put game_overlay $game mode=2,skiavk=1,downscaleFactor=0.7,fps=60:mode=3,skiavk=0,downscaleFactor=0.7,fps=60
     cmd game mode performance $game
     dumpsys deviceidle whitelist +$game
     settings put global updatable_driver_production_opt_in_apps "$game"
     cmd package compile -m everything-profile -f $game --primary-dex --secondary-dex --include-dependencies --full -p PRIORITY_INTERACTIVE_FAST --check-prof false
     cmd shortcut reset-throttling 
     am clear-watch-heap "$game"
}
Optimizegame 
sleep 2

echo "  --Settings"
# Settings
 setse() {
    settings put system user_refresh_rate 60
       settings put system peak_refresh_rate 60
       settings put system thermal_limit_refresh_rate 60
       settings put global cached_apps_freezer 1
}
setse > /dev/null 2>&1&
sleep 1

# Hibernating apps for stopping apps running in backgrounds, and optimization(also you can change from speed-profile to quicken-profile for faster compilation)
 for app in $(pm list packages -3); do
   app() {
     device_config put app_hibernation app_hibernation_enabled true
    cmd app_hibernation set-state $app true 
    cmd appops set $app RUN_IN_BACKGROUND ignore
    device_config put permissions auto_revoke_unused_threshold_millis2 1000
    cmd jobscheduler run -u 0 -f com.google.android.permissioncontroller 2
    device_config put activity_manager_native_boot use_freezer true
    cmd package compile -r first-boot -f $game
    am kill $app
    am make-uid-idle $app
   }
   app > /dev/null 2>&1&
done

# Trimming
# (Attention:Please deleted this settings/command if you're device is becoming laggy because of this command)
# Because if too much trimming can cause deleting cache and system files that unused
echo "  --Trimming"
 fstrim() {
   sm fstrim
   cmd package trim-caches 0
   sm idle-maint run
   am send-trim-memory $app COMPLETE
}
fstrim > /dev/null 2>&1&
sleep 1

#Idle
echo "  --Force Idle"
 idle() {
   dumpsys deviceidle force-idle deep
   dumpsys deviceidle enable deep 
   dumpsys deviceidle enable light
}
idle  > /dev/null 2>&1&

echo "  --End"

# Credit for Brainless for quick lauch feature
# Function to launch the app
 launch_app() {
    local abi=$1
    am start -S --user 0 "$id" --activity-clear-task --no-window-animation --activity-reorder-to-front \
        --ez android.intent.extra.disable_battery_optimization true \
        --ez android.intent.extra.enable_gpu_acceleration true \
        --ez android.intent.extra.priority true \
        --ez android.intent.extra.ALLOW_IDLE_MODE true \
        --ez android.intent.extra.low_ram true \
        --ez android.intent.extra.allow_background_activity_start false \
        --abi "$abi" 
}

# Attempt to launch the app with ARMEABI_V7A and fallback to default ABI
 if launch_app "ARMEABI_V7A"; then
    abi_status="32-bit"
 else
    abi_status="64-bit"
    launch_app "DEFAULT"
 fi
 
echo "App launched with $abi_status ABI."

# Post a notification about the launch
cmd notification post -t "ABI - $abi_status" -S inbox \
    --line "Module Executed Successfully" \
    --line "Feedback for bugs or errors." \
    myTag "Quick-Lauch - $game" 
sync