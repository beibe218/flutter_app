import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/demo/appstore/app_store_main.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      new SystemUiOverlayStyle(statusBarColor: Colors.grey[100],statusBarBrightness: Brightness.dark,statusBarIconBrightness: Brightness.dark,systemNavigationBarIconBrightness: Brightness.dark));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.grey[100],
        primaryColorDark: Colors.grey[100],
        backgroundColor: Colors.grey[100]),
    title: 'Fluter',
    home: new AppStoreMain(),
  ));
}
