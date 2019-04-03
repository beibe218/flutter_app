import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/demo/appstore/app_store_demo.dart';
import 'package:flutter_app/demo/appstore/app_store_games.dart';
import 'package:flutter_app/demo/appstore/app_store_search.dart';
import 'package:flutter_app/demo/appstore/app_store_today.dart';
import 'package:flutter_app/demo/appstore/app_store_update.dart';
import 'package:flutter_app/demo/appstore/model/apps.dart';
import 'package:flutter_app/demo/list_demo.dart';
import 'package:flutter_app/demo/list_load_demo.dart';

int lastIndex = 0;

class AppStoreMain extends StatelessWidget {
  static const routeName = '/app_store_main';

  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(new SystemUiOverlayStyle(
//        statusBarColor: const Color(0xCCF8F8F8),
//        statusBarBrightness: Brightness.dark,
//        statusBarIconBrightness: Brightness.dark));
    //隐藏状态栏和导航栏
//    SystemChrome.setEnabledSystemUIOverlays([]);
    //显示状态栏和导航栏
//    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
//    if (Platform.isAndroid) {

//    } else if (Platform.isIOS) {

//    }

    return WillPopScope(
        child: new CupertinoTabScaffold(
          tabBar: new CupertinoTabBar(items: const <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.home),
              title: const Text('Today'),
            ),
            const BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.folder),
                title: const Text('游戏')),
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
                    return new AppStoreGames(
                      items: gameDatas,
                    );
                    break;
                  case 2:
                    return new AppStoreApps(
                      items: appDatas,
                    );
                    break;
                  case 3:
                    return new AppStoreUpdate();
                    break;
                  case 4:
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
