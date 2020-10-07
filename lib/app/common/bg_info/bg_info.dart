///获取背景图片的抽象
abstract class BgInfo {
  Future<BgInfoBean> getBgInfo();
}

class BgInfoBean {
  ///图片url地址
  String picUrl;

  ///图片名称 eg : 必应背景；二次元动漫；高清风景背景
  String picName;

  ///图片文字描述
  String description;

  /// 作者
  String author;

  /// 时间
  String time;

  ///一些其他信息
  dynamic other;

  BgInfoBean({
    this.picUrl,
    this.picName,
    this.time,
    this.author,
    this.description,
    this.other,
  });
}
