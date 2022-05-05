import 'package:bivisoft/view/HomeScreen.dart';
import 'package:bivisoft/view/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Theme.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LoginUI",
      theme: defaultTargetPlatform == TargetPlatform.iOS ? KIOSTheme : KDefaultTheme,
      routes: <String, WidgetBuilder>{
        '/homeScreen' : (BuildContext context) => HomeScreen(),
      },
      home: LoginScreen(),
    );
  }
}