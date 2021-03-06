import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildAppIcon(String appIcon, double size) {
  return buildAppIconOverload(appIcon, size, 16.0);
}

Widget buildAppIconOverload(String appIcon, double size, double radius) {
  return new Container(
    width: size,
    height: size,
    decoration: new BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/$appIcon'), fit: BoxFit.cover),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        border:
            Border.all(color: CupertinoColors.lightBackgroundGray, width: 1.0)),
  );
}

Widget buildAppNameText(String appName) {
  return new Text(
    appName,
    style: TextStyle(
      fontSize: 16.0,
      color: CupertinoColors.black,
    ),
  );
}

Widget buildAppDescText(String appDesc) {
  return new Text(
    appDesc,
    style: TextStyle(fontSize: 13.0, color: Colors.grey),
  );
}

Widget buildAppGetButtonBlue(String text) {
  return buildAppGetButton(text, Colors.white, Colors.blueAccent);
}

Widget buildAppGetButtonGrey(String text) {
  return buildAppGetButton(
      text, Colors.blueAccent, CupertinoColors.lightBackgroundGray);
}

Widget buildAppGetButton(String text, Color textColor, Color btnColor) {
  return CupertinoButton(
    child: new Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.28,
      ),
    ),
    onPressed: () {},
    color: btnColor,
    padding: EdgeInsets.symmetric(horizontal: 24.0),
    borderRadius: new BorderRadius.circular(32.0),
    minSize: 32.0,
  );
}

Widget buildAppGetHintText() {
  return new Text(
    'App内购买项目',
    style: TextStyle(
      color: Colors.grey,
      fontSize: 10.0,
    ),
  );
}

Padding buildPaddingTop8() {
  return const Padding(padding: EdgeInsets.only(top: 8.0));
}

Widget buildPicture(String pictureName, double pictureWidth) {
  return new Container(
    width: pictureWidth,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/$pictureName'),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(12.0),
      ),
    ),
  );
}

Widget buildFootRow() {
  return new Container(
    margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildFootButton(Colors.blueAccent, '兑换'),
        buildPaddingTop8(),
        _buildFootButton(Colors.blueAccent, '为 Apple ID 充值'),
        buildPaddingTop8(),
        buildPaddingTop8(),
        new Divider(
          height: 1.0,
          color: Colors.grey[300],
        ),
        new Container(
          padding: EdgeInsets.symmetric(vertical: 14.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                '条款与条件',
                style: const TextStyle(color: Colors.grey, fontSize: 14.0),
              ),
              const Padding(padding: EdgeInsets.only(left: 5.0)),
              const Icon(
                CupertinoIcons.right_chevron,
                color: Colors.grey,
                size: 18,
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget _buildFootButton(Color color, String text) {
  return new Container(
    width: 9999.0,
    child: new CupertinoButton(
      child: new Text(
        text,
        style: new TextStyle(
            color: color, fontSize: 16.0, fontWeight: FontWeight.w700),
      ),
      onPressed: () {},
      color: Colors.blueGrey[50],
      padding: EdgeInsets.symmetric(vertical: 12.0),
    ),
  );
}
