import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/demo/app_detail_demo.dart';
import 'package:flutter_app/demo/app_model.dart';

final double pageWidth = 400.0;
BuildContext buildContext;

class AppStoreDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return Scaffold(
      appBar: new AppBar(
        title: Text('AppStore'),
      ),
      body: ListView(
        children: <Widget>[
          _buildHotView(),
          _buildDivider(),
          _buildHotAppView(),
          _buildDivider(),
          _buildRecommendAppView(),
          _buildDivider(),
          _buildFreshAppView(),
        ],
      ),
    );
  }
}

Widget _buildHotView() {
  return new SizedBox(
    height: 350.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        _buildHotItem(
            '正在热播', Colors.red, '腾讯视频', '知否知否正在热播', 'picture_zhifouzhifou.png'),
        _buildHotItem(
            '全网独播', Colors.yellow, '优酷视频', '《鬼吹灯之怒晴湘西》全网独播', 'picture_1.png'),
        _buildHotItem(
            '限时特惠', Colors.green, '专业录音笔记本', '订阅六折优惠', 'picture_2.png'),
      ],
    ),
  );
}

Widget _buildDivider() {
  return Container(
    margin: EdgeInsets.only(left: 8.0, right: 8.0),
    child: new Divider(
      height: 1.0,
    ),
  );
}

Widget _buildHotItem(String hotTitle, Color color, String title, String desc,
    String pictureName) {
  return Container(
    width: pageWidth,
    margin: EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 5.0),
          child: Text(
            hotTitle,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.blueAccent,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5.0),
          child: Text(
            desc,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          child: _buildImageItem(pictureName),
        )
      ],
    ),
  );
}

Widget _buildHotAppView() {
  return Container(
    width: pageWidth,
    child: Column(
      children: <Widget>[
        _buildTitleView('热门应用'),
        SizedBox(
          height: 201.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _buildHotAppItems('MOMO陌陌', '很高兴认识你', '腾讯视频', '知否知否正在热播',
                  'ic_momo.png', 'ic_tencent_video.png'),
              _buildHotAppItems('微信', '社交', '优酷视频-大帅哥全网独播', '国名少年侦探社、大江大河尽在优酷',
                  'ic_wechat.png', 'ic_youku.png'),
              _buildHotAppItems('QQ', '社交', '淘宝-移动购物，生活社区', '随时随地，想淘就淘',
                  'ic_qq.png', 'ic_taobao.png'),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _buildHotAppItems(String title, String desc, String title2, String desc2,
    String iconName1, String iconName2) {
  return new Container(
    width: pageWidth,
    height: 201.0,
    margin: EdgeInsets.only(left: 8.0, right: 8.0),
    child: Column(
      children: <Widget>[
        _buildHotAppItem(title, desc, iconName1),
        new Container(
          margin: EdgeInsets.only(left: 88.0),
          child: new Divider(
            height: 1.0,
          ),
        ),
        _buildHotAppItem(title2, desc2, iconName2),
      ],
    ),
  );
}

Widget _buildHotAppItem(String title, String desc, String iconName) {
  return new GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      _toAppDetail(new AppModel(iconName, title, desc));
    },
    child: Container(
      margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
      height: 80.0,
      width: pageWidth,
      child: Row(
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/' + iconName),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
                border: Border.all(
                    color: CupertinoColors.lightBackgroundGray, width: 1.0)),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                  child: Text(
                    desc,
                    style: TextStyle(fontSize: 13.0, color: Colors.grey),
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CupertinoButton(
                              color: CupertinoColors.lightBackgroundGray,
                              minSize: 30.0,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              borderRadius: new BorderRadius.circular(32.0),
                              child: const Text(
                                '获取',
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.28,
                                    color: Colors.blueAccent),
                              ),
                              onPressed: () {}),
                          Container(
                            margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'App内购买项目',
                              style:
                                  TextStyle(fontSize: 10.0, color: Colors.grey),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget _buildTitleView(String title) {
  return Container(
      margin: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
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
                        fontWeight: FontWeight.w500,
                        color: CupertinoColors.black),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    '查看全部',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 16.0, color: CupertinoColors.activeBlue),
                  ),
                ),
              )
            ],
          ),
        ],
      ));
}

Widget _buildRecommendAppView() {
  return new Container(
    width: pageWidth,
    child: new Column(
      children: <Widget>[
        _buildTitleView('指尖的色彩'),
        new SizedBox(
          height: 358.0,
          child: new ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _buildRecommendAppItem('填充色块 揭开图片背后的秘密', 'picture_2.png',
                  'ic_momo.png', 'MOMO陌陌', '很高兴认识你'),
              _buildRecommendAppItem(
                  '指尖的色彩', 'lake.jpg', 'ic_douyin.png', '抖音', '记录美好生活'),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _buildRecommendAppItem(String desc, String pictureName,
    String appIconName, String appName, String appDesc) {
  return new Container(
    margin: EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: new Text(
            desc,
            style: new TextStyle(fontSize: 14.0, color: Colors.grey),
          ),
        ),
        Expanded(child: _buildImageItem(pictureName)),
        _buildAppItemRow(appIconName, appName, appDesc)
      ],
    ),
  );
}

Widget _buildAppItemRow(String appIconName, String appName, String appDesc) {
  return new GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      _toAppDetail(new AppModel(appIconName, appName, appDesc));
    },
    child: new Container(
      width: pageWidth,
      child: new Row(
        children: <Widget>[
          new Container(
            width: 70.0,
            height: 70.0,
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

Widget _buildImageItem(String imageName) {
  return new Container(
    width: pageWidth,
    margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/' + imageName),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(12.0),
      ),
    ),
  );
}

Widget _buildFreshAppView() {
  return Container(
    width: pageWidth,
    child: new Column(
      children: <Widget>[
        _buildTitleView('新鲜App'),
        new SizedBox(
            height: 280.0,
            child: new ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildFreshAppItem(),
                _buildFreshAppItem(),
                _buildFreshAppItem(),
              ],
            ))
      ],
    ),
  );
}

Widget _buildFreshAppItem() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    height: 270.0,
    width: pageWidth,
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildAppItemRow('ic_wechat.png', '微信', '社交'),
        _buildAppItemDivider(),
        _buildAppItemRow('ic_momo.png', 'MOMO陌陌', '很高兴认识你'),
        _buildAppItemDivider(),
        _buildAppItemRow('ic_youku.png', '优酷视频', '知否知否正在热播'),
      ],
    ),
  );
}

Widget _buildAppItemDivider() {
  return Container(
    margin: EdgeInsets.only(left: 78.0),
    child: new Divider(
      height: 1.0,
    ),
  );
}

void _toAppDetail(AppModel appModel) {
  Navigator.push(
      buildContext,
      MaterialPageRoute(
          builder: (context) => new AppDetailDemo(
                appModel: appModel,
              )));
}
