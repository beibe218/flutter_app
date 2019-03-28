import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/demo/appstore/app_detail_demo.dart';
import 'package:flutter_app/demo/appstore/app_model.dart';
import 'package:flutter_app/demo/appstore/model/app_today_detail_model.dart';
import 'package:flutter_app/demo/appstore/style.dart';
import 'package:flutter_app/main.dart';
import 'package:video_player/video_player.dart';

Padding _buildPaddingTop8() {
  return const Padding(padding: EdgeInsets.only(top: 8.0));
}

Widget _buildSmallTitle(String text, Color color) {
  return new Text(
    text,
    style: new TextStyle(fontSize: 14.0, color: color),
  );
}

Widget _buildNormalTitle(String text, Color color) {
  return new Text(text,
      style: new TextStyle(
          fontSize: 28.0, color: color, fontWeight: FontWeight.w700));
}

class VideoPlayerLoading extends StatefulWidget {
  final String url;

  const VideoPlayerLoading(this.url);

  @override
  State<StatefulWidget> createState() => new VideoPlayerLoadingState();
}

class VideoPlayerLoadingState extends State<VideoPlayerLoading> {
//  bool _initialized;
  VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = new VideoPlayerController.asset('videos/butterfly.mp4');
//    _initialized = widget.controller.value.initialized;
//    widget.controller.addListener(() {
//      if (!mounted) {
//        return;
//      }
//      final bool controllerInitialized = widget.controller.value.initialized;
//      if (_initialized != controllerInitialized) {
//        setState(() {
//          _initialized = controllerInitialized;
//          widget.controller.setLooping(true);
//          widget.controller.play();
//        });
//      }
//    });
    controller.setLooping(true);
//    controller.addListener(() {});
    controller.initialize().then((_) {
      setState(() {
        controller.play();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controller.value.initialized
        ? new VideoPlayer(controller)
        : const Center(child: const CircularProgressIndicator());
  }
}

class AppStoreTodayDetails extends StatelessWidget {
  final AppTodayDetailModel model;

  AppStoreTodayDetails({Key key, @required this.model}) : super(key: key);

  Widget _buildItemDetailPage(AppTodayDetailModel model) {
    List<DetailItem> items = model.detailItems;
    return new ListView.builder(
      itemBuilder: (BuildContext _context, int index) {
        if (index > 0) {
          DetailItem item = items[index - 1];
          switch (item.type) {
            case 0:
              return _buildItemDetailTitleText(item.content);
              break;
            case 1:
              return _buildItemDetailContentText(item.content);
              break;
            case 2:
              return _buildItemDetailPictureView(item.content);
              break;
            case 3:
              return _buildAppGetRow();
              break;
            case 4:
              return _buildShareRow();
              break;
          }
        } else {
          return _buildItemDetailHeadView(
              model.picName, model.smallTitle, model.normalTitle);
        }
      },
      itemCount: items.length + 1,
    );
  }

  Widget _buildItemDetailPictureView(String content) {
    return new Container(
      height: 300.0,
      child: Image.asset(
        'images/${content}',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildItemDetailContentText(String contentText) {
    return new Padding(
      padding: EdgeInsets.all(16.0),
      child: new Text(
        contentText,
        style: new TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
            height: Platform.isIOS ? 1.0 : 1.3),
      ),
    );
  }

  Widget _buildItemDetailTitleText(String titleText) {
    return new Padding(
      padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: new Text(
        titleText,
        style: new TextStyle(
            fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _buildItemDetailHeadView(
      String picName, String smallTitle, String normalTitle) {
    return new Container(
      height: 500.0,
      decoration: new BoxDecoration(
          image: new DecorationImage(
              image: AssetImage('images/${picName}'), fit: BoxFit.cover)),
      child: new Padding(
        padding: EdgeInsets.all(16.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildSmallTitle(smallTitle, Colors.white),
                _buildPaddingTop8(),
                _buildNormalTitle(normalTitle, Colors.white)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppGetRow() {
    return new Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      padding: EdgeInsets.symmetric(vertical: 20.0),
      color: Colors.blueGrey[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
              height: 80.0,
              width: 80.0,
              decoration: new BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/${model.appInfo.appIcon}'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  border: Border.all(
                      color: CupertinoColors.lightBackgroundGray, width: 1.0))),
          _buildPaddingTop8(),
          new Text(
            model.appInfo.appName,
            style: new TextStyle(color: Colors.blueAccent, fontSize: 20.0),
          ),
          _buildPaddingTop8(),
          new Text(
            model.appInfo.appDesc,
            style: new TextStyle(color: Colors.grey, fontSize: 14.0),
          ),
          _buildPaddingTop8(),
          CupertinoButton(
            child: new Text(
              '获取',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.28,
              ),
            ),
            onPressed: () {},
            color: Colors.blueAccent,
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            borderRadius: new BorderRadius.circular(32.0),
            minSize: 32.0,
          ),
          new Padding(padding: EdgeInsets.only(top: 5.0)),
          new Text(
            'App内购买项目',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10.0,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildShareRow() {
    return new Center(
      child: new Container(
        width: 120.0,
        margin: EdgeInsets.only(top: 50.0, bottom: 30.0),
        padding: EdgeInsets.symmetric(vertical: 10.0),
        decoration: new BoxDecoration(
            color: Colors.blueGrey[50],
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            )),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              CupertinoIcons.share_up,
              color: Colors.blueAccent,
            ),
            const Padding(padding: EdgeInsets.only(left: 5.0)),
            const Text(
              '分享',
              style: const TextStyle(color: Colors.blueAccent, fontSize: 16.0),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildExitButton(BuildContext _context) {
    return new GestureDetector(
      onTap: () {
        SystemChrome.setEnabledSystemUIOverlays(
            [SystemUiOverlay.top, SystemUiOverlay.bottom]);
        Navigator.pop(_context);
      },
      child: new Container(
        width: 30.0,
        height: 30.0,
        decoration: new BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        child: const Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 隐藏状态栏
//    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: const Text('detail'),
        backgroundColor: Colors.grey[100],
      ),
      body: new Stack(
        alignment: Alignment(0.9, -0.9),
        children: <Widget>[
          _buildItemDetailPage(model),
//          _buildExitButton(context)
        ],
      ),
//      body: _buildItemDetailPage(model),
    );
  }
}

class AccountInfoPage extends StatelessWidget {
  Widget _buildAccountInfoItem() {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          new Container(
            width: 60.0,
            height: 60.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/ic_wechat.png'), fit: BoxFit.cover),
              shape: BoxShape.circle,
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 8.0)),
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  '杨学军',
                  style: const TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                const Padding(padding: EdgeInsets.only(top: 3.0)),
                const Text(
                  'jimmyakm@gmail.com',
                  style: const TextStyle(color: Colors.grey, fontSize: 14.0),
                )
              ],
            ),
          ),
          const Icon(
            CupertinoIcons.right_chevron,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget _buildPadding25() {
    return new Padding(padding: EdgeInsets.only(top: 25.0));
  }

  Widget _buildDivider(double paddingLeft) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: paddingLeft),
      child: new Divider(
        color: Colors.grey[250],
        height: 1.0,
      ),
    );
  }

  Widget _buildCommonText(String text, Color color, bool offstageRightChevron) {
    return new Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text(text, style: new TextStyle(color: color, fontSize: 18.0)),
          new Offstage(
            offstage: offstageRightChevron,
            child: const Icon(
              CupertinoIcons.right_chevron,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[150],
      appBar: new CupertinoNavigationBar(
        middle: const Text(
          '账户',
        ),
        backgroundColor: Style.actionbarColor,
      ),
      body: new ListView(
        children: <Widget>[
          _buildPadding25(),
          _buildDivider(0.0),
          _buildAccountInfoItem(),
          _buildDivider(0.0),
          _buildPadding25(),
          _buildDivider(0.0),
          _buildCommonText('已购项目', Colors.black, false),
          _buildDivider(16.0),
          _buildCommonText('个性化推荐', Colors.black, false),
          _buildDivider(0.0),
          _buildPadding25(),
          _buildDivider(0.0),
          _buildCommonText('兑换礼品卡或代码', Colors.blueAccent, true),
          _buildDivider(16.0),
          _buildCommonText('为 Apple ID 充值', Colors.blueAccent, true),
          _buildDivider(0.0),
          _buildPadding25(),
          _buildDivider(0.0),
          _buildCommonText('退出登录', Colors.blueAccent, true),
          _buildDivider(0.0),
        ],
      ),
    );
  }
}

class AppToday extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new AppTodayState();
}

class AppTodayState extends State<AppToday> {
  BuildContext _context;
  AppInfo app1 = new AppInfo('ic_wechat.png', '微信', '社交');
  AppInfo app2 = new AppInfo('ic_momo.png', 'MOMO陌陌', '很高兴认识你');
  AppInfo app3 = new AppInfo('ic_youku.png', '优酷视频', '知否知否正在热播');
  AppInfo app4 = new AppInfo('ic_douyin.png', '抖音', '记录美好生活');
  AppInfo app5 = new AppInfo('ic_qq.png', 'QQ', '社交');
  AppInfo app6 = new AppInfo('ic_kugou.png', '酷狗音乐', '酷狗音乐，因你而酷');
  AppInfo app7 = new AppInfo('ic_wangyimusic.png', '网易云音乐', '音乐的力量');
  AppInfo app8 = new AppInfo('ic_taobao.png', '淘宝', '随时随地，想淘就淘');

  List<AppTodayItem> todayItems;

  @override
  void initState() {
    super.initState();
    List<AppInfo> appInfo1 = <AppInfo>[app1, app2, app3, app4, app5];
    List<AppInfo> appInfo2 = <AppInfo>[app5, app6, app7, app8, app3];

    var item1 = new AppTodayItem(ViewType.type_1, 'pic_chiji_1.jpg', '精选游戏',
        Colors.grey, '徒步生存之旅', '绝地求生大逃杀', Colors.white, [app1]);

    var item2 = new AppTodayItem(ViewType.type_2, 'pic_chiji_1.jpg', '今日主题',
        Colors.grey, '', '热门App', Colors.black, appInfo1);

    var item3 = new AppTodayItem(ViewType.type_3, 'pic_today_4.png', '',
        Colors.white, '', '小视频社交App', Colors.white, [app4]);

    var item4 = new AppTodayItem(ViewType.type_4, 'pic_today_2.jpg', '电子竞技',
        Colors.grey, '我的世界为什么好玩？', '我的世界', Colors.black, [app3]);

    var item6 = new AppTodayItem(ViewType.type_2, 'lake.jpg', '游戏人生',
        Colors.grey, '', '偶尔耍点坏', Colors.black, appInfo2);

    var item5 = new AppTodayItem(ViewType.type_3, 'pic_today_2.jpg', '电子竞技',
        Colors.white, '', '我的世界为什么\n好玩？', Colors.white, [app4]);

    todayItems = <AppTodayItem>[item1, item2, item3, item4, item5, item6];
  }

  ShapeBorder _buildItemShape() {
    return const RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
      topLeft: const Radius.circular(16.0),
      topRight: const Radius.circular(16.0),
      bottomLeft: const Radius.circular(16.0),
      bottomRight: const Radius.circular(16.0),
    ));
  }

  void toItemDetail(String smallTitle, String normalTitle, String picName,
      contentTitle, AppInfo appInfo) {
    List<DetailItem> items = new List();
    items.add(new DetailItem(0, contentTitle));
    items.add(new DetailItem(
        1,
        '噫吁嚱，危乎高哉！蜀道之难，难于上青天！蚕丛及鱼凫，开国何茫然！尔来四万八千岁，不与秦塞通人烟。'
        '西当太白有鸟道，可以横绝峨眉巅。'
        '地崩山摧壮士死，然后天梯石栈相钩连。'
        '上有六龙回日之高标，下有冲波逆折之回川。'
        '黄鹤之飞尚不得过，猿猱欲度愁攀援。'));
    items.add(new DetailItem(2, 'pic_chiji_1.jpg'));

    items.add(new DetailItem(0, '绝地求生刺激战场 为什么这么好玩？'));
    items.add(new DetailItem(
        1,
        '青泥何盘盘，百步九折萦岩峦。'
        '扪参历井仰胁息，以手抚膺坐长叹。'
        '问君西游何时还？畏途巉岩不可攀。'
        '但见悲鸟号古木，雄飞雌从绕林间。'
        '又闻子规啼夜月，愁空山。'));

    items.add(new DetailItem(2, 'picture_zhifouzhifou.png'));

    items.add(new DetailItem(
        1,
        '蜀道之难，难于上青天，使人听此凋朱颜！连峰去天不盈尺，枯松倒挂倚绝壁。'
        '飞湍瀑流争喧豗，砯崖转石万壑雷。'
        '其险也如此，嗟尔远道之人胡为乎来哉！剑阁峥嵘而崔嵬，一夫当关，万夫莫开。'
        '所守或匪亲，化为狼与豺。朝避猛虎，夕避长蛇；磨牙吮血，杀人如麻。'
        '锦城虽云乐，不如早还家。蜀道之难，难于上青天，侧身西望长咨嗟！'));

    items.add(new DetailItem(3, ''));
    items.add(new DetailItem(4, ''));

    var model = new AppTodayDetailModel(
        smallTitle, normalTitle, picName, items, appInfo);

    Navigator.of(
      _context,
      rootNavigator: true,
    ).push(new CupertinoPageRoute(
        builder: (_context) => new AppStoreTodayDetails(
              model: model,
            )));
  }

  void showAccountInfoPage() {
    Navigator.of(_context, rootNavigator: true)
        .push(MaterialPageRoute(builder: (context) => new AccountInfoPage()));
  }

  Widget _buildTitle() {
    return new Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSmallTitle('3月5日 星期二', Colors.grey),
              const Padding(padding: EdgeInsets.only(top: 5.0)),
              _buildNormalTitle('今日推荐', Colors.black),
            ],
          ),
          new GestureDetector(
            onTap: () {
              showAccountInfoPage();
            },
            child: new Container(
              width: 50.0,
              height: 50.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/ic_wechat.png'),
                    fit: BoxFit.cover),
                shape: BoxShape.circle,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItem1(AppTodayItem item, bool isVideo) {
    return new Container(
      height: isVideo ? 350.0 : 400.0,
      child: new Card(
        shape: _buildItemShape(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Expanded(
                child: isVideo
                    ? new Container(
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(16.0),
                              topRight: const Radius.circular(16.0)),
                        ),
                        child: new VideoPlayerLoading(''),
                      )
                    : new Container(
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(16.0),
                              topRight: const Radius.circular(16.0)),
                          image: new DecorationImage(
                              image: AssetImage('images/${item.picture}'),
                              fit: BoxFit.cover),
                        ),
                      )),
            new Padding(
              padding: EdgeInsets.all(16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildSmallTitle(item.subTitle, Colors.grey),
                  _buildPaddingTop8(),
                  _buildNormalTitle(item.title, Colors.black),
                  _buildPaddingTop8(),
                  _buildSmallTitle(item.subTitle2, Colors.grey),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildItem2(AppTodayItem item) {
    return new Container(
      height: 400.0,
      child: new Card(
        shape: _buildItemShape(),
        child: new Container(
          decoration: new BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/${item.picture}'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          padding: EdgeInsets.all(16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSmallTitle(item.subTitle, item.subTitleColor),
              _buildPaddingTop8(),
              _buildNormalTitle(item.title, item.titleColor)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem3(AppTodayItem item) {
    return new Container(
      height: 420.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: new Card(
        shape: _buildItemShape(),
        child: new Padding(
          padding: EdgeInsets.all(16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSmallTitle(item.subTitle, item.subTitleColor),
              _buildPaddingTop8(),
              _buildNormalTitle(item.title, item.titleColor),
              Expanded(
                  child: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildAppItem(item.apps[0].appIcon, item.apps[0].appName,
                        item.apps[0].appDesc),
                    _buildAppItemDivider(),
                    _buildAppItem(item.apps[1].appIcon, item.apps[1].appName,
                        item.apps[1].appDesc),
                    _buildAppItemDivider(),
                    _buildAppItem(item.apps[2].appIcon, item.apps[2].appName,
                        item.apps[2].appDesc),
                    _buildAppItemDivider(),
                    _buildAppItem(item.apps[3].appIcon, item.apps[3].appName,
                        item.apps[3].appDesc),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppItemDivider() {
    return Container(
      margin: EdgeInsets.only(left: 68.0),
      child: new Divider(
        height: 1.0,
      ),
    );
  }

  void _toAppDetail(AppModel appModel) {
    Navigator.push(
        _context,
        CupertinoPageRoute(
            builder: (context) => new AppDetailDemo(
                  appModel: appModel,
                )));
  }

  Widget _buildAppItem(String appIconName, String appName, String appDesc) {
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _toAppDetail(new AppModel(appIconName, appName, appDesc));
      },
      child: new Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: new Row(
          children: <Widget>[
            new Container(
              width: 60.0,
              height: 60.0,
              decoration: new BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/${appIconName}'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  border: Border.all(
                      color: CupertinoColors.lightBackgroundGray, width: 1.0)),
            ),
            Expanded(
              child: new Container(
                margin: EdgeInsets.only(left: 8.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      appName,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: CupertinoColors.black,
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child: new Text(
                        appDesc,
                        style: TextStyle(fontSize: 13.0, color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ),
            ),
            new Column(
              children: <Widget>[
                CupertinoButton(
                  child: new Text(
                    '获取',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.28,
                    ),
                  ),
                  onPressed: () {},
                  color: CupertinoColors.lightBackgroundGray,
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  borderRadius: new BorderRadius.circular(32.0),
                  minSize: 32.0,
                ),
                new Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: new Text(
                    'App内购买项目',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,
                    ),
                  ),
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
    _context = context;
    return new Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: new CupertinoNavigationBar(
        backgroundColor: Style.actionbarColor,
        middle: const Text(
          'Toaday',
        ),
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return _buildTitle();
          }

          AppTodayItem item = todayItems[index - 1];
          Widget itemView;

          if (item.viewType == ViewType.type_1) {
            itemView = _buildItem1(item, false);
          } else if (item.viewType == ViewType.type_2) {
            itemView = _buildItem3(item);
          } else if (item.viewType == ViewType.type_3) {
            itemView = _buildItem2(item);
          } else if (item.viewType == ViewType.type_4) {
            itemView = _buildItem1(item, false);
          }

          return new GestureDetector(
            onTap: () {
              if (item.viewType != ViewType.type_2) {
                toItemDetail(item.subTitle, item.title, item.picture,
                    item.title, item.apps[0]);
              }
            },
            child: new Container(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: itemView,
            ),
          );
        },
        itemCount: todayItems.length + 1,
      ),
    );
  }
}

class AppTodayItem {
  ViewType viewType;
  String picture;
  String subTitle;
  Color subTitleColor;
  String subTitle2;
  String title;
  Color titleColor;
  List<AppInfo> apps;

  AppTodayItem(this.viewType, this.picture, this.subTitle, this.subTitleColor,
      this.subTitle2, this.title, this.titleColor, this.apps);
}

enum ViewType { type_1, type_2, type_3, type_4 }

class AppInfo {
  String appIcon;
  String appName;
  String appDesc;

  AppInfo(this.appIcon, this.appName, this.appDesc);
}
