import 'package:flutter_app/demo/appstore/model/apps.dart';

class AppTodayDetailModel{
  final String smallTitle;
  final String normalTitle;
  final String picName;
  final List<DetailItem> detailItems;
  final AppInfo appInfo;

  AppTodayDetailModel(this.smallTitle, this.normalTitle, this.picName,
      this.detailItems,this.appInfo);
}

class DetailItem{
  final int type;
  final String content;

  DetailItem(this.type, this.content);
}
