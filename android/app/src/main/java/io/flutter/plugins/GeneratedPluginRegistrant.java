package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import me.yohom.amapbasesearch.AMapBaseSearchPlugin;
import com.jzoom.amaplocation.AmapLocationPlugin;
import io.flutter.plugins.connectivity.ConnectivityPlugin;
import com.github.marekchen.flutterqq.FlutterQqPlugin;
import io.github.ponnamkarthik.toast.fluttertoast.FluttertoastPlugin;
import io.flutter.plugins.imagepicker.ImagePickerPlugin;
import com.bigbug.mmkvflutter.MmkvFlutterPlugin;
import io.flutter.plugins.pathprovider.PathProviderPlugin;
import com.baseflow.permissionhandler.PermissionHandlerPlugin;
import io.flutter.plugins.share.SharePlugin;
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin;
import com.tekartik.sqflite.SqflitePlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    AMapBaseSearchPlugin.registerWith(registry.registrarFor("me.yohom.amapbasesearch.AMapBaseSearchPlugin"));
    AmapLocationPlugin.registerWith(registry.registrarFor("com.jzoom.amaplocation.AmapLocationPlugin"));
    ConnectivityPlugin.registerWith(registry.registrarFor("io.flutter.plugins.connectivity.ConnectivityPlugin"));
    FlutterQqPlugin.registerWith(registry.registrarFor("com.github.marekchen.flutterqq.FlutterQqPlugin"));
    FluttertoastPlugin.registerWith(registry.registrarFor("io.github.ponnamkarthik.toast.fluttertoast.FluttertoastPlugin"));
    ImagePickerPlugin.registerWith(registry.registrarFor("io.flutter.plugins.imagepicker.ImagePickerPlugin"));
    MmkvFlutterPlugin.registerWith(registry.registrarFor("com.bigbug.mmkvflutter.MmkvFlutterPlugin"));
    PathProviderPlugin.registerWith(registry.registrarFor("io.flutter.plugins.pathprovider.PathProviderPlugin"));
    PermissionHandlerPlugin.registerWith(registry.registrarFor("com.baseflow.permissionhandler.PermissionHandlerPlugin"));
    SharePlugin.registerWith(registry.registrarFor("io.flutter.plugins.share.SharePlugin"));
    SharedPreferencesPlugin.registerWith(registry.registrarFor("io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin"));
    SqflitePlugin.registerWith(registry.registrarFor("com.tekartik.sqflite.SqflitePlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
