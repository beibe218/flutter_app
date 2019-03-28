import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/demo/appstore/app_store_main.dart';
import 'package:flutter_app/demo/appstore/style.dart';

void main() {
  runApp(MaterialApp(
    theme: new ThemeData(
        primaryColor: Style.statusBarColor,
        primaryColorDark: Style.statusBarColor,
        primaryColorLight: Style.statusBarColor,
        primaryColorBrightness: Brightness.dark,
    ),
    debugShowCheckedModeBanner: false,
    title: 'Fluter',
    home: new AppStoreMain(),
  ));

  SystemChrome.setSystemUIOverlayStyle(new SystemUiOverlayStyle(
      statusBarColor: Style.statusBarColor,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
}
