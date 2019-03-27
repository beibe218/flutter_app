import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/demo/appstore/model/app_today_detail_model.dart';
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

class AppStoreToday extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new AppStoreTodayState();
}

class AppStoreTodayState extends State<AppStoreToday> {
  BuildContext _context;

//  VideoPlayerController _controller;

//  bool _isPlaying = false;

  String url =
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(new SystemUiOverlayStyle(
        statusBarColor: Colors.grey[100],
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));
//    _controller = VideoPlayerController.asset('videos/butterfly.mp4');
//    _controller = VideoPlayerController.network(url)
    // 播放状态
//      ..addListener(() {
//        final bool isPlaying = _controller.value.isPlaying;
//        if (isPlaying != _isPlaying) {
//          setState(() {
//            _isPlaying = isPlaying;
//          });
//        }
//      })
//      // 在初始化完成后必须更新界面
//      ..initialize().then((_) {
//        setState(() {
//          _controller.play();
//        });
//      });
//
//    _controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
//    _controller.dispose();
  }

  void showAccountInfoPage() {
    Navigator
        .of(_context, rootNavigator: true)
        .push(MaterialPageRoute(builder: (context) => new AccountInfoPage()));
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

  Widget _buildAppItemDivider() {
    return Container(
      margin: EdgeInsets.only(left: 68.0),
      child: new Divider(
        height: 1.0,
      ),
    );
  }

  void toItemDetail(
      String smallTitle, String normalTitle, String picName, contentTitle) {
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

    var model =
        new AppTodayDetailModel(smallTitle, normalTitle, picName, items);

    Navigator
        .of(
          _context,
          rootNavigator: true,
        )
        .push(new CupertinoPageRoute(
            builder: (_context) => new AppStoreTodayDetails(
                  model: model,
                )));
  }

  Widget _buildTitle() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildSmallTitle('3月5日 星期二', Colors.grey),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            _buildNormalTitle('Today', Colors.black),
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
                  image: AssetImage('images/ic_wechat.png'), fit: BoxFit.cover),
              shape: BoxShape.circle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildItem1(String smallTitle, String normalTitle,
      Color smallTitleColor, Color titleColor, String picName) {
    return new GestureDetector(
      onTap: () {
        toItemDetail(smallTitle, normalTitle, picName, normalTitle);
      },
      child: new Container(
        height: 500.0,
        child: new Card(
          shape: _buildItemShape(),
          child: new Container(
            decoration: new BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/${picName}'), fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            padding: EdgeInsets.all(16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildSmallTitle(smallTitle, smallTitleColor),
                _buildPaddingTop8(),
                _buildNormalTitle(normalTitle, Colors.white)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem2() {
    return new Container(
      height: 500.0,
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
              _buildSmallTitle('今日主题', Colors.grey),
              _buildPaddingTop8(),
              _buildNormalTitle('热门App', Colors.black),
              Expanded(
                  child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildAppItemRow('ic_wechat.png', '微信', '社交'),
                  _buildPaddingTop8(),
                  _buildAppItemDivider(),
                  _buildPaddingTop8(),
                  _buildAppItemRow('ic_momo.png', 'MOMO陌陌', '很高兴认识你'),
                  _buildPaddingTop8(),
                  _buildAppItemDivider(),
                  _buildPaddingTop8(),
                  _buildAppItemRow('ic_youku.png', '优酷视频', '知否知否正在热播'),
                  _buildPaddingTop8(),
                  _buildAppItemDivider(),
                  _buildPaddingTop8(),
                  _buildAppItemRow('ic_douyin.png', '抖音', '记录美好生活'),
                  _buildPaddingTop8(),
                  _buildAppItemDivider(),
                  _buildPaddingTop8(),
                  _buildAppItemRow('ic_qq.png', 'QQ', '社交'),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppItemRow(String appIconName, String appName, String appDesc) {
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: new Container(
        child: new Row(
          children: <Widget>[
            new Container(
              width: 60.0,
              height: 60.0,
              decoration: new BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/' + appIconName),
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

  Widget _buildItem3(String smallTitle, String normalTitle, String smallTitle2,
      Color smallTitleColor, Color titleColor, String picName, bool isVideo) {
    return GestureDetector(
      onTap: () {
        toItemDetail(smallTitle, normalTitle, picName, normalTitle);
      },
      child: new Container(
        height: isVideo ? 350.0 : 500.0,
        child: new Card(
          shape: _buildItemShape(),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                  child: isVideo
                      ? new VideoPlayerLoading(url)
                      : new Container(
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(16.0),
                                topRight: const Radius.circular(16.0)),
                            image: new DecorationImage(
                                image: AssetImage('images/${picName}'),
                                fit: BoxFit.cover),
                          ),
                        )),
              new Padding(
                padding: EdgeInsets.all(16.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildSmallTitle(smallTitle, Colors.grey),
                    _buildPaddingTop8(),
                    _buildNormalTitle(normalTitle, Colors.black),
                    _buildPaddingTop8(),
                    _buildSmallTitle(smallTitle2, Colors.grey),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return new Scaffold(
      backgroundColor: Colors.grey[100],
      body: new Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: new ListView(
          children: <Widget>[
            _buildPaddingTop8(),
            _buildTitle(),
            _buildPaddingTop8(),
            _buildItem3('精选游戏', '绝地求生刺激战场', '徒步生存之旅', Colors.white,
                Colors.white, 'pic_chiji_1.jpg', false),
            _buildPaddingTop8(),
            _buildItem2(),
            _buildPaddingTop8(),
            _buildItem1('', '', Colors.white, Colors.white, 'pic_today_4.png'),
            _buildPaddingTop8(),
            _buildItem2(),
            _buildPaddingTop8(),
            _buildItem1('电子竞技', '《我的世界》为什么\n好玩？', Colors.white, Colors.white,
                'pic_today_2.jpg'),
            _buildPaddingTop8(),
            _buildItem3('精选游戏', '绝地求生刺激战场', '徒步生存之旅', Colors.white,
                Colors.white, 'pic_chiji_1.jpg', true),
            _buildPaddingTop8(),
          ],
        ),
      ),
    );
  }
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
        style: new TextStyle(fontSize: 20.0, color: Colors.grey, height: 1.5),
      ),
    );
  }

  Widget _buildItemDetailTitleText(String titleText) {
    return new Padding(
      padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: new Text(
        titleText,
        style: new TextStyle(
            fontSize: 28.0, color: Colors.black, fontWeight: FontWeight.w700),
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

  Widget _buildExitButton(BuildContext _context) {
    return new GestureDetector(
      onTap: () {
//        SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top,SystemUiOverlay.bottom]);
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
      ),
//      body: new Stack(
//        alignment: Alignment(0.9, -0.9),
//        children: <Widget>[
//          _buildItemDetailPage(model),
//          _buildExitButton(context)
//        ],
//      ),
      body: _buildItemDetailPage(model),
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
        middle: const Text('账户'),
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
