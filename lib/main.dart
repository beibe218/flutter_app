import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/demo/appstore/app_store_main.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.red, primaryColorDark: Colors.red),
    title: 'Fluter',
    home: new AppStoreMain(),
  ));
}
