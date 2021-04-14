import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: new Scaffold(
      body: MainClass(),
    ),
  ));
}

class MainClass extends StatefulWidget {
  @override
  _MainClassState createState() => _MainClassState();
}

class _MainClassState extends State<MainClass> {
  String batteryLevel = "not yet";
  static const MethodChannel methodChannelANDROID =
  MethodChannel('com.ahmed.channel/android');
  static const MethodChannel methodChannelIOS =
  MethodChannel('com.ahmed.channel/ios');

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: new FloatingActionButton(
        onPressed: () {
          getDataFromNativeCode();
        },
        child: Text(batteryLevel),
      ),
    );
  }

  void getDataFromNativeCode() async {
    String result = "";
    if (Platform.isAndroid) {
      result = await methodChannelANDROID.invokeMethod('androidMethod');
    } else if (Platform.isIOS) {
      result = await methodChannelIOS.invokeMethod('iosMethod');
    }

    try {
      setState(() {
        batteryLevel = result;
      });
    } catch (error) {
      print(error);
    }
  }
}
