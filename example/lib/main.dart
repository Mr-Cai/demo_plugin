import 'dart:async';

import 'package:demo_plugin/demo_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> showToast() async {
    await DemoPlugin.showToast('然后我们来测试');
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await DemoPlugin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Text(
                'Running on: $_platformVersion\n',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
            CupertinoButton(
              child: Text('点我'),
              color: Colors.lightGreen,
              onPressed: () => showToast(),
            )
          ],
        ),
      ),
    );
  }
}
