import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/demo/appstore/app_store_demo.dart';
import 'package:flutter_app/demo/appstore/app_store_search.dart';
import 'package:flutter_app/demo/appstore/app_store_today.dart';

int lastIndex = 0;

class AppStoreMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(new SystemUiOverlayStyle(
//        statusBarColor: const Color(0xCCF8F8F8),
//        statusBarBrightness: Brightness.dark,
//        statusBarIconBrightness: Brightness.dark));

//    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
//    SystemChrome.setSystemUIOverlayStyle(new SystemUiOverlayStyle(
//        statusBarColor: Colors.grey[100],
//        statusBarBrightness: Brightness.dark,
//        statusBarIconBrightness: Brightness.dark));
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
          new SystemUiOverlayStyle(statusBarColor: Colors.grey[100],statusBarBrightness: Brightness.dark,statusBarIconBrightness: Brightness.dark,systemNavigationBarIconBrightness: Brightness.dark));
    } else if (Platform.isIOS) {
//      SystemChrome.setSystemUIOverlayStyle(
//          new SystemUiOverlayStyle(statusBarColor: Colors.white));
    }

    return WillPopScope(
        child: new CupertinoTabScaffold(
          tabBar: new CupertinoTabBar(items: const <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.home),
              title: const Text('Today'),
            ),
            const BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.plus_circled),
                title: const Text('App')),
            const BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.down_arrow),
                title: const Text('更新')),
            const BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.search),
                title: const Text('搜素'))
          ]),
          tabBuilder: (BuildContext context, int index) {
            return new CupertinoTabView(
              builder: (BuildContext context) {
                switch (index) {
                  case 0:
                    return new AppStoreToday();
                    break;
                  case 1:
                    return new AppStoreDemo();
                    break;
                  case 2:
                    break;
                  case 3:
                    return new AppStoreSearch();
                    break;
                }
              },
            );
          },
        ),
        onWillPop: () => new Future<bool>.value(true));
  }
}
