class AppTodayDetailModel{
  final String smallTitle;
  final String normalTitle;
  final String picName;
  final List<DetailItem> detailItems;

  AppTodayDetailModel(this.smallTitle, this.normalTitle, this.picName,
      this.detailItems);
}

class DetailItem{
  final int type;
  final String content;

  DetailItem(this.type, this.content);
}
