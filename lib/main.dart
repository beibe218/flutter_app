import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/demo/appstore/app_store_main.dart';

void main() {
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
