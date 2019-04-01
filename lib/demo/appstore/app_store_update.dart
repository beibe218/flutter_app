import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/demo/appstore/app_detail_demo.dart';
import 'package:flutter_app/demo/appstore/app_model.dart';
import 'package:flutter_app/demo/appstore/style.dart';
import 'package:flutter_app/demo/appstore/utils/ui_utils.dart';

class AppStoreUpdate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AppStoreUpdateState();
  }
}

class AppStoreUpdateState extends State<AppStoreUpdate> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: const CupertinoNavigationBar(
        backgroundColor: Style.actionbarColor,
        middle: const Text('更新'),
      ),
      body: new ListView(
        children: <Widget>[
          new AppUpdateItem(app1, false),
          new AppUpdateItem(app2, false),
          new AppUpdateItem(app3, false),
          new AppUpdateItem(app4, false),
          new AppUpdateItem(app5, false),
          new AppUpdateItem(app6, false),
          new AppUpdateItem(app7, false),
          new AppUpdateItem(app8, true),
        ],
      ),
    );
  }
}

class AppUpdateItem extends StatefulWidget {
  final AppInfo appInfo;
  final bool lastItem;

  AppUpdateItem(this.appInfo, this.lastItem);

  @override
  State<StatefulWidget> createState() {
    return new AppUpdateItemState();
  }
}

class AppUpdateItemState extends State<AppUpdateItem> {
  BuildContext _context;
  int textLine = 2;
  bool invisibleMore = false;

  void _toAppDetail(AppModel appModel) {
    Navigator.push(
        _context,
        CupertinoPageRoute(
            builder: (context) => new AppDetailDemo(
                  appModel: appModel,
                )));
  }

  Widget _buildUpdateItem(AppInfo info, bool lastItem, Color backgroundColor) {
    if (info.clickMore) {
      invisibleMore = true;
      textLine = null;
    }

    Widget row = new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _toAppDetail(new AppModel(info.appIcon, info.appName, info.appDesc));
      },
      child: new Container(
        color: backgroundColor,
        padding: EdgeInsets.all(16.0),
        child: new Stack(
          alignment: Alignment(1.0, 1.0),
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildAppIcon(info.appIcon, 60.0),
                    Expanded(
                      child: new Container(
                        margin: EdgeInsets.only(left: 8.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            buildAppNameText(info.appName),
                            const Padding(padding: EdgeInsets.only(top: 5.0)),
                            buildAppDescText(info.appDesc)
                          ],
                        ),
                      ),
                    ),
                    buildAppGetButtonGrey('更新'),
                  ],
                ),
                buildPaddingTop8(),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Stack(
                      alignment: Alignment(1.0, 1.0),
                      children: <Widget>[
                        new Text(
                          '* Pavlova is a meringue-based dessert named after \n* '
                              'Pavlova features a crisp crust and soft,light insid topped with fruit and whipped cream.\n* '
                              '噫吁嚱，危乎高哉！蜀道之难，难于上青天！\n* '
                              '蚕丛及鱼凫，开国何茫然！尔来四万八千岁，不与秦塞通人烟\n* '
                              '黄鹤之飞尚不得过，猿猱欲度愁攀援。\n* '
                              '青泥何盘盘，百步九折萦岩峦。',
                          maxLines: textLine,
                          style: const TextStyle(
                              fontSize: 14.0, color: Colors.black, height: 1.3),
                        ),
                      ],
                    ),
                    new Padding(
                        padding: invisibleMore
                            ? EdgeInsets.only(top: 16.0)
                            : EdgeInsets.only(top: 0.0)),
                    Offstage(
                      offstage: !invisibleMore,
                      child: const Text(
                        '版本 6.3.90 129.2MB',
                        style:
                            const TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                    )
                  ],
                )
              ],
            ),
            Offstage(
              offstage: invisibleMore,
              child: new Container(
                child: new GestureDetector(
                  onTap: () {
                    setState(() {
                      info.clickMore = true;
                      invisibleMore = true;
                      textLine = null;
                    });
                  },
                  child: const Text(
                    '更多',
                    style: const TextStyle(
                        fontSize: 14.0, color: Colors.blueAccent),
                  ),
                ),
                color: backgroundColor,
                padding: EdgeInsets.all(3.0),
              ),
            ),
          ],
        ),
      ),
    );

    if (lastItem) {
      return row;
    }

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        row,
        Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: new Divider(
            height: 1.0,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    final ThemeData themeData = Theme.of(context);
    Color color = themeData.scaffoldBackgroundColor;
    return _buildUpdateItem(widget.appInfo, widget.lastItem, color);
  }
}
