import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/demo/appstore/app_store_demo.dart';
import 'package:flutter_app/demo/appstore/app_store_today.dart';
import 'package:flutter_app/demo/list_demo.dart';

class AppStoreMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setEnabledSystemUIOverlays([]);
    return WillPopScope(
        child: new CupertinoTabScaffold(
          tabBar: new CupertinoTabBar(items: const <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.home),
              title: const Text('Today'),
            ),
            const BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.plus_circled),
                title: const Text('App')
            ),
            const BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.down_arrow),
                title: const Text('更新')
            ),
            const BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.search),
                title: const Text('搜素')
            )
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
                    return new AppStoreDemo();
                    break;
                  case 3:
                    return new ListDemo();
                    break;
                }
              },
            );
          },
        ),
        onWillPop: () => new Future<bool>.value(true));
  }
}
