import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/demo/appstore/app_detail_demo.dart';
import 'package:flutter_app/demo/appstore/app_model.dart';
import 'package:flutter_app/demo/appstore/utils/ui_utils.dart';

const double horListWidth = 350.0;
BuildContext _context;

void _toAppDetail(AppGamesAppInfo app) {
  var model = new AppModel(app.appIcon, app.appName, app.appDesc);
  Navigator.push(
      _context,
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

Widget _buildAppItem(String appIcon, String appName, String appDesc) {
  return new GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      if(appIcon.isNotEmpty){
        _toAppDetail(new AppGamesAppInfo(appIcon, appName, appDesc, '', '', ''));
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

class AppStoreGames extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AppStoreGamesState();
  }
}

class AppStoreGamesState extends State<AppStoreGames> {
  AppGamesAppInfo game1 = new AppGamesAppInfo('ic_game_1.png', '风之大陆', '紫龙游戏',
      '重磅更新', '开放“闪卡”升级系统', 'pictures_game1_09.jpg');

  AppGamesAppInfo game2 = new AppGamesAppInfo('ic_game_2.png', '航海王：燃烧意志',
      '航海王正版3D角色扮演手游', '预定开启', '“你想成为航海王吗？', 'pictures_game2_01.jpg');

  AppGamesAppInfo game3 = new AppGamesAppInfo('ic_game_3.png', '绝地求生', '春日特训版本',
      '重磅更新', '四周年庆典开启', 'pictures_game3_01.jpg');

  AppGamesAppInfo game4 = new AppGamesAppInfo('ic_game_4.png', '狂野飙车8：急速凌云',
      '在线急速街机赛车游戏', '重磅更新', '新增限时活动：天选之人', 'pictures_game4_01.jpg');

  AppGamesAppInfo game5 = new AppGamesAppInfo('ic_game_5.png', '极品飞车17',
      '破2亿下载量你还不玩？', '重磅更新', '新增限时活动：天选之人', 'pictures_game5_01.jpg');

  AppGamesAppInfo game6 = new AppGamesAppInfo('ic_game_6.png', '真实赛车3',
      'EA出品，必属精品。', '重磅更新', '新增限时活动：天选之人', 'pictures_game6_01.jpg');

  AppGamesAppInfo game7 = new AppGamesAppInfo('ic_game_7.png', 'QQ飞车',
      '腾讯唯一官方正版《QQ飞车手游》', '重磅更新', '新增限时活动：天选之人', 'pictures_game7_01.jpg');

  AppGamesAppInfo game8 = new AppGamesAppInfo('ic_game_8.png', '王者荣耀',
      '在线急速街机赛车游戏', '重磅更新', '新增限时活动：天选之人', 'pictures_game8_01.jpg');

  AppGamesAppInfo game9 = new AppGamesAppInfo('ic_game_9.png', '天天酷跑',
      '在线急速街机赛车游戏', '重磅更新', '新增限时活动：天选之人', 'pictures_game1_08.jpg');

  AppGamesAppInfo game10 = new AppGamesAppInfo('ic_game_10.png', '我的世界',
      '中国顶尖UGC游戏平台', '重磅更新', '新增限时活动：天选之人', 'pic_today_2.jpg');

  AppGamesAppInfo game11 = new AppGamesAppInfo('ic_game_11.png', '保卫萝卜',
      '制作精美、真正可爱范儿的超萌塔防游戏', '重磅更新', '新增限时活动：天选之人', 'pictures_game11_01.jpg');

  AppGamesAppInfo game12 = new AppGamesAppInfo('ic_game_12.png', '穿越火线:枪战王者',
      '三亿手机枪战梦想（最新版）', '重磅更新', '新增限时活动：天选之人', 'pictures_game1_07.jpg');

  AppGamesAppInfo game13 = new AppGamesAppInfo('ic_game_13.png', '像素枪战',
      '沙盒风格的第一人称射击游戏', '重磅更新', '新增限时活动：天选之人', 'pictures_game13_01.jpg');

  AppGamesAppInfo game14 = new AppGamesAppInfo('ic_game_14.png', '梦幻西游',
      '人气超高的网络游戏同名手游', '重磅更新', '新增限时活动：天选之人', 'pictures_game14_01.jpg');

  AppGamesAppInfo game15 = new AppGamesAppInfo('ic_game_15.png', '我叫MT2-新宠来袭',
      '策略游戏', '重磅更新', '新增限时活动：天选之人', 'pictures_game1_06.jpg');

  AppGamesAppInfo game16 = new AppGamesAppInfo('ic_game_16.png', '海之号角', '冒险游戏',
      '重磅更新', '新版本更新，还不赶快下载！', 'pictures_game16_01.jpg');

  AppGamesAppInfo link1 =
      new AppGamesAppInfo('', '绑定支付宝、微信支付或银行卡', '', '', '', '');
  AppGamesAppInfo link2 =
      new AppGamesAppInfo('', 'App Store 家长指南', '', '', '', '');
  AppGamesAppInfo link3 =
      new AppGamesAppInfo('', '进一步了解 App 内购买项目', '', '', '', '');
  AppGamesAppInfo link4 =
      new AppGamesAppInfo('', '儿童类 App 和游戏', '', '', '', '');
  AppGamesAppInfo link5 = new AppGamesAppInfo('', '关于个性化', '', '', '', '');
  AppGamesAppInfo link6 =
      new AppGamesAppInfo('', '轻松上手 App Store', '', '', '', '');

  List<AppGamesItem> items;

  @override
  void initState() {
    super.initState();
    AppGamesItem gameItems =
        new AppGamesItem(ViewType.type1, '', [game1, game2, game3, game4]);

    AppGamesItem gameItems2 = new AppGamesItem(ViewType.type2, '热门游戏', [
      game1,
      game2,
      game3,
      game4,
      game5,
      game6,
      game7,
      game8,
      game9,
      game10,
    ]);

    AppGamesItem gameItems3 = new AppGamesItem(ViewType.type3, '最佳更新', [
      game11,
      game12,
      game13,
      game14,
      game15,
      game16,
      game1,
      game2,
      game3,
      game4,
    ]);

    AppGamesItem gameItems4 = new AppGamesItem(ViewType.type4, '更多你可能喜欢的游戏', [
      game1,
      game2,
      game3,
      game4,
      game5,
      game6,
      game7,
      game8,
      game9,
      game10,
      game11,
      game12,
      game13,
      game14,
      game15,
      game16,
    ]);

    AppGamesItem gameItems5 = new AppGamesItem(ViewType.type5, '今天玩什么', [
      game13,
      game11,
      game16,
      game14,
      game5,
      game6,
      game7,
      game8,
      game9,
    ]);

    AppGamesItem gameItems6 = new AppGamesItem(ViewType.type6, '热门分类', [
      game1,
      game3,
      game5,
      game7,
      game9,
      game11,
    ]);

    AppGamesItem gameItems7 = new AppGamesItem(ViewType.type2, '免费游戏排行', [
      game1,
      game2,
      game3,
      game4,
      game5,
      game6,
      game10,
      game12,
      game14,
      game16,
    ]);

    AppGamesItem gameItems8 = new AppGamesItem(ViewType.type3, '最佳更新', [
      game9,
      game8,
      game7,
      game6,
      game5,
      game4,
      game3,
      game2,
      game1,
      game11,
    ]);

    AppGamesItem gameItems9 = new AppGamesItem(ViewType.type7, '快速连接', [
      link1,
      link2,
      link3,
      link4,
      link5,
      link6,
    ]);

    AppGamesItem gamesItem10 = new AppGamesItem(ViewType.type8, '', []);

    items = <AppGamesItem>[
      gameItems,
      gameItems2,
      gameItems3,
      gameItems4,
      gameItems5,
      gameItems6,
      gameItems7,
      gameItems8,
      gameItems9,
      gamesItem10
    ];
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return new Scaffold(
      appBar: CupertinoNavigationBar(
        middle: const Text('游戏'),
      ),
      body: new ListView.builder(
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
      ),
    );
  }
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
              _toAppDetail(app);
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

  Widget _buildItem(List<AppGamesAppInfo> apps, bool lastItem) {
    AppGamesAppInfo app2;
    AppGamesAppInfo app3;
    if (apps.length > 1) {
      app2 = apps[1];
    }

    if (apps.length > 2) {
      app3 = apps[2];
    }

    Widget app2Item = app2 != null
        ? _buildAppItem(app2.appIcon, app2.appName, app2.appDesc)
        : _buildAppItem('', '', '');

    Widget app3Item = app3 != null
        ? _buildAppItem(app3.appIcon, app3.appName, app3.appDesc)
        : _buildAppItem('', '', '');

    return new Container(
      width: horListWidth,
      margin: lastItem
          ? EdgeInsets.symmetric(horizontal: 16.0)
          : EdgeInsets.only(left: 16.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildAppItem(
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
                return _buildItem(apps, index == list.length - 1);
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

  Widget _buildItem(List<AppGamesAppInfo> apps, bool lastItem) {
    AppGamesAppInfo app2;

    if (apps.length > 1) {
      app2 = apps[1];
    }

    Widget app1Item =
        _buildAppItem(apps[0].appIcon, apps[0].appName, apps[0].appDesc);

    Widget app2Item = app2 != null
        ? _buildAppItem(app2.appIcon, app2.appName, app2.appDesc)
        : _buildAppItem('', '', '');

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
            opacity: app2Item == null ? 0.0 : 1.0,
            child: app2Item,
          )
        ],
      ),
    );
  }

  Widget _buildAppItem(String appIcon, String appName, String appDesc) {
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _toAppDetail(
            new AppGamesAppInfo(appIcon, appName, appDesc, '', '', ''));
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
              return _buildItem(apps, index == list.length - 1);
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
  Widget _buildItem(AppGamesAppInfo app, bool lastItem) {
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _toAppDetail(app);
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
              return _buildItem(apps, index == widget.item.apps.length - 1);
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
  Widget _buildItem(AppGamesAppInfo app, bool lastItem) {
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _toAppDetail(app);
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
              _buildAppItem(app.appIcon, app.appName, app.appDesc)
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
              return _buildItem(app, index == widget.item.apps.length - 1);
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
          _toAppDetail(app);
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

class AppGamesItem {
  ViewType viewType;
  String title;
  List<AppGamesAppInfo> apps;

  AppGamesItem(this.viewType, this.title, this.apps);
}

class AppGamesAppInfo extends AppInfo {
  String subTitle;
  String subTitle2;
  String appPicture;

  AppGamesAppInfo(String appIcon, String appName, String appDesc, this.subTitle,
      this.subTitle2, this.appPicture)
      : super(appIcon, appName, appDesc);
}

enum ViewType {
  type1,
  type2,
  type3,
  type4,
  type5,
  type6,
  type7,
  type8,
}
