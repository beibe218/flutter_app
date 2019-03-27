import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/demo/appstore/app_store_main.dart';
import 'package:flutter_app/demo/appstore/style.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Fluter',
    home: new AppStoreMain(),
  ));

  SystemChrome.setSystemUIOverlayStyle(new SystemUiOverlayStyle(
      statusBarColor: Style.statusBarColor,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
}
