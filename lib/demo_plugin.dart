import 'dart:async';

import 'package:flutter/services.dart';

class DemoPlugin {
  static MethodChannel _channel = MethodChannel('demo_plugin');
  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> showToast(String msg) async {
    final args = {};
    args.putIfAbsent('msg', () => msg);
    await _channel.invokeMethod('nativeToast', args);
  }
}
 