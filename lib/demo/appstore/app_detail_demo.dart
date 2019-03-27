import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/demo/appstore/app_model.dart';

class AppDetailDemo extends StatelessWidget {
  final AppModel appModel;

  AppDetailDemo({Key key, @required this.appModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new CupertinoNavigationBar(
        middle: new Text(appModel.title),
        backgroundColor: Colors.grey[100],
//        trailing: const ExitButton(),
      ),
      body: new ListView(
        children: <Widget>[
//          const Padding(padding: EdgeInsets.only(top: 16.0)),
          _buildAppInfoRow(
              appModel.iconRes, appModel.title, appModel.description),
          _buildScoreRow(),
          const Padding(padding: EdgeInsets.only(top: 16.0)),
          _buildAppPictureRow()
        ],
      ),
    );
  }
}

class ExitButton extends StatelessWidget {
  const ExitButton();

  @override
  Widget build(BuildContext context) {
    return new CupertinoButton(
      padding: EdgeInsets.zero,
      child: const Tooltip(
        message: 'Back',
//        child: const Text('Exit'),
        excludeFromSemantics: true,
      ),
      onPressed: () {
        // The demo is on the root navigator.
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
  }
}

Widget _buildDivider() {
  return Container(
    margin: EdgeInsets.only(left: 8.0, right: 8.0),
    child: new Divider(
      height: 1.0,
    ),
  );
}

Widget _buildAppInfoRow(String iconRes, String title, String desc) {
  return new Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: new Row(
      children: <Widget>[
        new Container(
          width: 120.0,
          height: 120.0,
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage('images/${iconRes}'), fit: BoxFit.cover),
              borderRadius: new BorderRadius.all(Radius.circular(28.0)),
              border: new Border.all(
                  width: 1.0, color: CupertinoColors.lightBackgroundGray)),
        ),
        Expanded(
            child: new Container(
          height: 152.0,
          margin: EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    title,
                    style: TextStyle(fontSize: 22.0, color: Colors.black),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5.0)),
                  new Text(
                    desc,
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new CupertinoButton(
                      color: CupertinoColors.activeBlue,
                      minSize: 30.0,
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      borderRadius: new BorderRadius.circular(32.0),
                      child: new Text(
                        '获取',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {}),
                  new CupertinoButton(
                    color: CupertinoColors.activeBlue,
                    minSize: 30.0,
                    padding: EdgeInsets.zero,
                    borderRadius: new BorderRadius.circular(32.0),
                    child: const Icon(CupertinoIcons.ellipsis,
                        color: CupertinoColors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ))
      ],
    ),
  );
}

Widget _buildScoreRow() {
  return new Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              children: <Widget>[
                _buildScoreFirstLevelText('4.7'),
                new Icon(
                  Icons.star,
                  color: Colors.red,
                ),
                new Icon(
                  Icons.star,
                  color: Colors.red,
                ),
                new Icon(
                  Icons.star,
                  color: Colors.red,
                ),
                new Icon(
                  Icons.star,
                  color: Colors.red,
                ),
                new Icon(
                  Icons.star,
                  color: Colors.grey,
                )
              ],
            ),
            _buildScoreSecondaryText('48.6万个评分')
          ],
        ),
        new Column(
          children: <Widget>[
            _buildScoreFirstLevelText('#30'),
            _buildScoreSecondaryText('社交'),
          ],
        ),
        new Column(
          children: <Widget>[
            _buildScoreFirstLevelText('4+'),
            _buildScoreSecondaryText('年龄'),
          ],
        )
      ],
    ),
  );
}

Widget _buildScoreFirstLevelText(String text) {
  return new Text(
    text,
    style: TextStyle(
        color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 28.0),
  );
}

Widget _buildScoreSecondaryText(String text) {
  return new Text(text, style: TextStyle(color: Colors.grey, fontSize: 14.0));
}

Widget _buildAppPictureRow() {
  return new SizedBox(
    height: 450.0,
    child: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext _context, int index) {
          return _buildAppPictureItem(index);
        }),
  );
}

Widget _buildAppPictureItem(int i) {
  return new Container(
    width: 260.0,
    margin: i == 4
        ? EdgeInsets.symmetric(horizontal: 16.0)
        : EdgeInsets.only(left: 16.0),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/pic_momo_${i + 1}.png'),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(6.0),
      ),
    ),
  );
}
