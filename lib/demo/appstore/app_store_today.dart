import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppStoreToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: new ListView(
          children: <Widget>[
            _buildPaddingTop8(),
            _buildTitle(),
            _buildPaddingTop8(),
            _buildItem3('', '', Colors.white, Colors.white, 'pic_chiji_1.jpg'),
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
          ],
        ),
      ),
    );
  }
}

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
      new Container(
        width: 50.0,
        height: 50.0,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/ic_wechat.png'), fit: BoxFit.cover),
          shape: BoxShape.circle,
        ),
      )
    ],
  );
}

Widget _buildItem1(String smallTitle, String normalTitle, Color smallTitleColor,
    Color titleColor, String picName) {
  return new Container(
    height: 550.0,
    child: new Card(
      elevation: 1.5,
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
  );
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

Widget _buildItem2() {
  return new Container(
    height: 550.0,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    child: new Card(
      elevation: 1.5,
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
//                _buildPaddingTop8(),
//                _buildAppItemDivider(),
//                _buildPaddingTop8(),
//                _buildAppItemRow('ic_taobao.png', '淘宝', '随时随地想淘就淘'),
              ],
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

Widget _buildItem3(String smallTitle, String normalTitle, Color smallTitleColor,
    Color titleColor, String picName) {
  return new Container(
    height: 550.0,
    child: new Card(
      elevation: 1.5,
      shape: _buildItemShape(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Expanded(
              child: new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage('images/${picName}'), fit: BoxFit.cover),
            ),
          )),
          new Padding(
            padding: EdgeInsets.all(16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildSmallTitle('精选游戏', Colors.grey),
                _buildPaddingTop8(),
                _buildNormalTitle('绝地求生刺激战场', Colors.black),
                _buildPaddingTop8(),
                _buildSmallTitle('徒步生存之旅', Colors.grey),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
