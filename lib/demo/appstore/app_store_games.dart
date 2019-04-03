import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/demo/appstore/app_detail_demo.dart';
import 'package:flutter_app/demo/appstore/app_model.dart';
import 'package:flutter_app/demo/appstore/model/apps.dart';
import 'package:flutter_app/demo/appstore/utils/ui_utils.dart';

const double horListWidth = 350.0;

void _toAppDetail(BuildContext context, AppGamesAppInfo app) {
  var model = new AppModel(app.appIcon, app.appName, app.appDesc);
  Navigator.push(
      context,
      CupertinoPageRoute(
          builder: (context) => new AppDetailDemo(
                appModel: model,
              )));
}

Widget _buildTitleView(String title) {
  return _buildTitleViewOverload(title, true);
}

Widget _buildTitleViewOverload(String title, bool showLookAll) {
  return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: CupertinoColors.black),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Opacity(
                    opacity: showLookAll ? 1.0 : 0.0,
                    child: Text(
                      '查看全部',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 16.0, color: CupertinoColors.activeBlue),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ));
}

Widget _buildAppItemDivider(double marginLeft) {
  return new Container(
    margin: new EdgeInsets.only(left: marginLeft),
    child: new Divider(
      height: 1.0,
    ),
  );
}

Widget _buildAppItem(
    BuildContext context, String appIcon, String appName, String appDesc) {
  return new GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      if (appIcon.isNotEmpty) {
        _toAppDetail(context,
            new AppGamesAppInfo(appIcon, appName, appDesc, '', '', ''));
      }
    },
    child: new Container(
      width: horListWidth,
      child: new Row(
        children: <Widget>[
          buildAppIcon(appIcon, 70.0),
          const Padding(padding: EdgeInsets.only(left: 8.0)),
          Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildAppNameText(appName),
                const Padding(padding: EdgeInsets.only(top: 5.0)),
                buildAppDescText(appDesc)
              ],
            ),
          ),
          new Column(
            children: <Widget>[
              buildAppGetButtonGrey('获取'),
              const Padding(padding: EdgeInsets.only(top: 5.0)),
              buildAppGetHintText()
            ],
          )
        ],
      ),
    ),
  );
}

List<List<AppGamesAppInfo>> splitApps(List<AppGamesAppInfo> apps, int size) {
  List<List<AppGamesAppInfo>> list = <List<AppGamesAppInfo>>[];
  for (int i = 0; i < apps.length; i += size) {
    int end = i + size;
    if (end > apps.length) {
      end = apps.length;
    }
    List<AppGamesAppInfo> sublist = apps.sublist(i, end);
    list.add(sublist);
  }
  return list;
}

class AppStoreApps extends StatefulWidget {
  final List<AppGamesItem> items;

  const AppStoreApps({Key key, this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new AppStoreAppsState();
  }
}

class AppStoreAppsState extends State<AppStoreApps> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: CupertinoNavigationBar(
        middle: const Text('App'),
      ),
      body: _buildAppList(widget.items),
    );
  }
}

class AppStoreGames extends StatefulWidget {
  final List<AppGamesItem> items;

  const AppStoreGames({Key key, this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new AppStoreGamesState();
  }
}

class AppStoreGamesState extends State<AppStoreGames> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: CupertinoNavigationBar(
        middle: const Text('游戏'),
      ),
      body: _buildAppList(widget.items),
    );
  }
}

Widget _buildAppList(List<AppGamesItem> items) {
  return new ListView.builder(
    itemBuilder: (BuildContext context, int index) {
      AppGamesItem item = items[index];

      if (item.viewType == ViewType.type8) {
        return buildFootRow();
      }

      Widget row;
      if (item.viewType == ViewType.type1) {
        row = new AppHorizontalList1(apps: item.apps);
      } else if (item.viewType == ViewType.type2) {
        row = new AppHorizontalList2(
          item: item,
        );
      } else if (item.viewType == ViewType.type3) {
        row = new AppHorizontalList3(
          item: item,
        );
      } else if (item.viewType == ViewType.type4) {
        row = new AppHorizontalList4(
          item: item,
        );
      } else if (item.viewType == ViewType.type5) {
        row = new AppHorizontalList5(
          item: item,
        );
      } else if (item.viewType == ViewType.type6) {
        row = new AppHorizontalList6(
          item: item,
        );
      } else if (item.viewType == ViewType.type7) {
        row = new AppHorizontalList7(
          item: item,
        );
      } else if (item.viewType == ViewType.type8) {
        row = buildFootRow();
      }

      Widget rootRow = new Column(
        children: <Widget>[
          row,
          new Padding(
              padding: index == items.length - 2
                  ? EdgeInsets.only(top: 0.0)
                  : EdgeInsets.only(top: 16.0))
        ],
      );

      if (index == items.length - 2) {
        return rootRow;
      }

      return new Column(
        children: <Widget>[
          rootRow,
          new Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: new Divider(
              height: 1.0,
            ),
          )
        ],
      );
    },
    itemCount: items.length,
  );
}

class AppHorizontalList1 extends StatelessWidget {
  final List<AppGamesAppInfo> apps;

  const AppHorizontalList1({Key key, this.apps}) : super(key: key);

  Widget _buildItem(AppGamesAppInfo app, bool lastItem) {
    return new Container(
      padding: EdgeInsets.only(top: 16.0),
      margin: lastItem
          ? EdgeInsets.symmetric(horizontal: 16.0)
          : EdgeInsets.only(left: 16.0),
      width: horListWidth,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            app.subTitle,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.blueAccent,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 5.0)),
          new Text(
            app.appName,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 5.0)),
          new Text(
            app.subTitle2,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
          buildPaddingTop8(),
          new Expanded(child: buildPicture(app.appPicture, horListWidth))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      height: 300.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          AppGamesAppInfo app = apps[index];
          Widget item = _buildItem(app, index == apps.length - 1);
          return new GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              _toAppDetail(context, app);
            },
            child: item,
          );
        },
        itemCount: apps.length,
      ),
    );
  }
}

class AppHorizontalList2 extends StatefulWidget {
  final AppGamesItem item;

  const AppHorizontalList2({Key key, this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new AppHorizontalList2State();
  }
}

class AppHorizontalList2State extends State<AppHorizontalList2> {
  List<List<AppGamesAppInfo>> list;

  @override
  void initState() {
    super.initState();
    List<AppGamesAppInfo> apps = widget.item.apps;
    list = splitApps(apps, 3);
  }

  Widget _buildItem(
      BuildContext context, List<AppGamesAppInfo> apps, bool lastItem) {
    AppGamesAppInfo app2;
    AppGamesAppInfo app3;
    if (apps.length > 1) {
      app2 = apps[1];
    }

    if (apps.length > 2) {
      app3 = apps[2];
    }

    Widget app2Item = app2 != null
        ? _buildAppItem(context, app2.appIcon, app2.appName, app2.appDesc)
        : _buildAppItem(context, '', '', '');

    Widget app3Item = app3 != null
        ? _buildAppItem(context, app3.appIcon, app3.appName, app3.appDesc)
        : _buildAppItem(context, '', '', '');

    return new Container(
      width: horListWidth,
      margin: lastItem
          ? EdgeInsets.symmetric(horizontal: 16.0)
          : EdgeInsets.only(left: 16.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildAppItem(
            context,
            apps[0].appIcon,
            apps[0].appName,
            apps[0].appDesc,
          ),
          _buildAppItemDivider(78.0),
          new Opacity(
            opacity: app2 == null ? 0.0 : 1.0,
            child: app2Item,
          ),
          new Opacity(
            opacity: app3 == null ? 0.0 : 1.0,
            child: _buildAppItemDivider(78.0),
          ),
          new Opacity(
            opacity: app3 == null ? 0.0 : 1.0,
            child: app3Item,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          _buildTitleView(widget.item.title),
          new SizedBox(
            height: 244.0,
            child: new ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                List<AppGamesAppInfo> apps = list[index];
                return _buildItem(context, apps, index == list.length - 1);
              },
              itemCount: list.length,
            ),
          )
        ],
      ),
    );
  }
}

class AppHorizontalList3 extends StatefulWidget {
  final AppGamesItem item;

  const AppHorizontalList3({Key key, this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new AppHorizontalList3State();
  }
}

class AppHorizontalList3State extends State<AppHorizontalList3> {
  List<List<AppGamesAppInfo>> list;

  @override
  void initState() {
    super.initState();
    List<AppGamesAppInfo> apps = widget.item.apps;
    list = splitApps(apps, 2);
  }

  Widget _buildItem(
      BuildContext context, List<AppGamesAppInfo> apps, bool lastItem) {
    AppGamesAppInfo app2;

    if (apps.length > 1) {
      app2 = apps[1];
    }

    Widget app1Item = _buildAppItem(
        context, apps[0].appIcon, apps[0].appName, apps[0].appDesc);

    Widget app2Item = app2 != null
        ? _buildAppItem(context, app2.appIcon, app2.appName, app2.appDesc)
        : _buildAppItem(context, '', '', '');

    return Container(
      margin: lastItem
          ? EdgeInsets.symmetric(horizontal: 16.0)
          : EdgeInsets.only(left: 16.0),
      width: horListWidth,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          app1Item,
          _buildAppItemDivider(88.0),
          new Opacity(
            opacity: app2 == null ? 0.0 : 1.0,
            child: app2Item,
          )
        ],
      ),
    );
  }

  Widget _buildAppItem(
      BuildContext context, String appIcon, String appName, String appDesc) {
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if(appIcon.isNotEmpty){
          _toAppDetail(context,
              new AppGamesAppInfo(appIcon, appName, appDesc, '', '', ''));
        }
      },
      child: Container(
        height: 80.0,
        width: horListWidth,
        child: Row(
          children: <Widget>[
            buildAppIcon(appIcon, 80.0),
            const Padding(padding: EdgeInsets.only(left: 8.0)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildAppNameText(appName),
                    const Padding(padding: EdgeInsets.only(top: 5.0)),
                    buildAppDescText(appDesc)
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildAppGetButtonGrey('获取'),
                    const Padding(padding: EdgeInsets.only(left: 5.0)),
                    buildAppGetHintText()
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        _buildTitleView(widget.item.title),
        new SizedBox(
          height: 178.0,
          child: new ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              List<AppGamesAppInfo> apps = list[index];
              return _buildItem(context, apps, index == list.length - 1);
            },
            itemCount: list.length,
          ),
        )
      ],
    );
  }
}

class AppHorizontalList4 extends StatefulWidget {
  final AppGamesItem item;

  const AppHorizontalList4({Key key, this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new AppHorizontalList4State();
  }
}

class AppHorizontalList4State extends State<AppHorizontalList4> {
  Widget _buildItem(BuildContext context, AppGamesAppInfo app, bool lastItem) {
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _toAppDetail(context, app);
      },
      child: new Container(
        margin: lastItem
            ? EdgeInsets.symmetric(horizontal: 16.0)
            : EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: buildAppIconOverload(app.appIcon, 180.0, 52.0)),
            buildPaddingTop8(),
            buildAppNameText(app.appName),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            buildAppDescText(app.appDesc),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        _buildTitleView(widget.item.title),
        new SizedBox(
          height: 226,
          child: new ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              AppGamesAppInfo apps = widget.item.apps[index];
              return _buildItem(
                  context, apps, index == widget.item.apps.length - 1);
            },
            itemCount: widget.item.apps.length,
          ),
        )
      ],
    );
  }
}

class AppHorizontalList5 extends StatefulWidget {
  final AppGamesItem item;

  const AppHorizontalList5({Key key, this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new AppHorizontalList5State();
  }
}

class AppHorizontalList5State extends State<AppHorizontalList5> {
  Widget _buildItem(BuildContext context, AppGamesAppInfo app, bool lastItem) {
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _toAppDetail(context, app);
      },
      child: new Container(
          width: horListWidth,
          margin: lastItem
              ? EdgeInsets.symmetric(horizontal: 16.0)
              : EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildAppDescText(app.subTitle2),
              buildPaddingTop8(),
              Expanded(child: buildPicture(app.appPicture, horListWidth)),
              buildPaddingTop8(),
              _buildAppItem(context, app.appIcon, app.appName, app.appDesc)
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        _buildTitleView(widget.item.title),
        new SizedBox(
          height: 320,
          child: new ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              AppGamesAppInfo app = widget.item.apps[index];
              return _buildItem(
                  context, app, index == widget.item.apps.length - 1);
            },
            itemCount: widget.item.apps.length,
          ),
        )
      ],
    );
  }
}

class AppHorizontalList6 extends StatefulWidget {
  final AppGamesItem item;

  const AppHorizontalList6({Key key, this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new AppHorizontalList6State();
  }
}

class AppHorizontalList6State extends State<AppHorizontalList6> {
  List<AppGamesAppInfo> apps;

  @override
  void initState() {
    super.initState();
    apps = widget.item.apps;
  }

  List<Widget> _buildItems() {
    List<Widget> children = <Widget>[];
    for (int i = 0; i < apps.length; i++) {
      AppGamesAppInfo app = apps[i];
      Widget row = new GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _toAppDetail(context, app);
        },
        child: _buildItem(app.appIcon, app.appName),
      );
      if (i == apps.length - 1) {
        children.add(row);
      } else {
        Widget row2 = new Column(
          children: <Widget>[row, _buildAppItemDivider(56.0)],
        );

        children.add(row2);
      }
    }
    return children;
  }

  Widget _buildItem(String appIcon, String appName) {
    return new Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: new Row(
        children: <Widget>[
          buildAppIcon(appIcon, 40.0),
          const Padding(padding: EdgeInsets.only(left: 16.0)),
          Expanded(
              child: new Text(
            appName,
            style: const TextStyle(fontSize: 18.0, color: Colors.black),
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        _buildTitleView(widget.item.title),
        new Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildItems(),
            ))
      ],
    );
  }
}

class AppHorizontalList7 extends StatefulWidget {
  final AppGamesItem item;

  const AppHorizontalList7({Key key, this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new AppHorizontalList7State();
  }
}

class AppHorizontalList7State extends State<AppHorizontalList7> {
  List<AppGamesAppInfo> apps;

  @override
  void initState() {
    super.initState();
    apps = widget.item.apps;
  }

  List<Widget> _buildItems() {
    List<Widget> children = <Widget>[];
    for (int i = 0; i < apps.length; i++) {
      AppGamesAppInfo app = apps[i];
      Widget row = _buildItem(app.appIcon, app.appName);
      if (i == apps.length - 1) {
        children.add(row);
      } else {
        Widget row2 = new Column(
          children: <Widget>[row, _buildAppItemDivider(0.0)],
        );

        children.add(row2);
      }
    }
    return children;
  }

  Widget _buildItem(String appIcon, String appName) {
    return new Container(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: new Row(
        children: <Widget>[
          new Text(
            appName,
            style: const TextStyle(fontSize: 18.0, color: Colors.blueAccent),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        _buildTitleViewOverload('快速连接', false),
        new Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildItems(),
            ))
      ],
    );
  }
}
