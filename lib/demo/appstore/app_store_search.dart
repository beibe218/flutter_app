import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/demo/appstore/style.dart';

const List<String> hotSearchNames = const <String>[
  '热门搜索',
  '完美世界',
  '麻将',
  '银河历险记2',
  '绝地求生大逃杀',
  '网易云音乐',
  '腾讯体育',
  '完美世界',
  '麻将',
  '银河历险记2',
  '绝地求生大逃杀',
  '网易云音乐',
  '腾讯体育',
  '完美世界',
  '麻将',
  '银河历险记2',
  '绝地求生大逃杀',
  '网易云音乐',
  '腾讯体育',
  '完美世界',
  '麻将',
  '银河历险记2',
  '绝地求生大逃杀',
  '网易云音乐',
  '腾讯体育',
  '完美世界',
  '麻将',
  '银河历险记2',
  '绝地求生大逃杀',
  '网易云音乐',
  '腾讯体育',
  '完美世界',
  '麻将',
  '银河历险记2',
  '绝地求生大逃杀',
  '网易云音乐',
  '腾讯体育',
  '完美世界',
  '麻将',
  '银河历险记2',
  '绝地求生大逃杀',
  '网易云音乐',
  '腾讯体育',
  '完美世界',
  '麻将',
  '银河历险记2',
  '绝地求生大逃杀',
  '网易云音乐',
  '腾讯体育',
];

class AppStoreSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new AppStoreSearchState();
}

class AppStoreSearchState extends State<AppStoreSearch> {
  Widget _buildSearchTextField() {
    return new Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 30.0),
      padding: EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          )),
      child: new Center(
        child: new Row(
          children: <Widget>[
            Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            new Expanded(
                child: new TextFormField(
              decoration: InputDecoration.collapsed(
                  hintText: 'AppStore',
                  hintStyle:
                      const TextStyle(color: Colors.grey, fontSize: 16.0)),
              style: const TextStyle(color: Colors.black, fontSize: 16.0),
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildHotSearchItem(String text, Color color, bool lastItem) {
    Widget row = new Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: new Text(
        text,
        style: new TextStyle(fontSize: 16.0, color: color),
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
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: const Text('搜索'),
        backgroundColor: Style.actionbarColor,
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return _buildSearchTextField();
          }

          return _buildHotSearchItem(
              hotSearchNames[index - 1],
              index == 1 ? Colors.black : Colors.blueAccent,
              index == hotSearchNames.length);
        },
        itemCount: hotSearchNames.length + 1,
      ),
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: CustomScrollView(
//        slivers: <Widget>[
//          const CupertinoSliverNavigationBar(
//            largeTitle: const Text('搜索'),
//          ),
//          new SliverPadding(
//            // Top media padding consumed by CupertinoSliverNavigationBar.
//            // Left/Right media padding consumed by Tab1RowItem.
//            padding: MediaQuery
//                .of(context)
//                .removePadding(
//                  removeTop: true,
//                  removeLeft: true,
//                  removeRight: true,
//                )
//                .padding,
//            sliver: new SliverList(
//              delegate: new SliverChildBuilderDelegate(
//                (BuildContext context, int index) {
//                  if (index == 0) {
//                    return _buildSearchTextField();
//                  }
//
//                  return _buildHotSearchItem(
//                      hotSearchNames[index - 1],
//                      index == 1 ? Colors.black : Colors.blueAccent,
//                      index == hotSearchNames.length);
//                },
//                childCount: hotSearchNames.length + 1,
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }

}
