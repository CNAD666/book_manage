part of 'home_bloc.dart';

class HomeState {
  ///是否出入loading状态
  bool isLoading;

  ///背景类型  二次元动漫   mc动漫  高清风景
  List<BgTypeBean> bgTypeList;

  ///被选择的背景
  BgTypeBean selectedBgType;

  ///缓存上一张背景数据
  String lastBgUrl;

  HomeState() {
    this.isLoading = false;
    this.bgTypeList = [
      BgTypeBean(name: "二次元动漫", url: PicUrl.PIC_ANIME),
      BgTypeBean(name: "mc酱动漫", url: PicUrl.PIC_MC_ANIME),
      BgTypeBean(name: "高清风景", url: PicUrl.PIC_HD_SIGHTS)
    ];
    this.selectedBgType = bgTypeList[0];
    this.lastBgUrl = "";
  }

  ///创建克隆对象方法
  HomeState clone() {
    return HomeState()
      ..isLoading = this.isLoading
      ..selectedBgType = this.selectedBgType
      ..lastBgUrl = this.lastBgUrl
      ..bgTypeList = this.bgTypeList;
  }
}

///背景类型实体
class BgTypeBean {
  ///背景名称
  String name;

  ///url
  String url;

  BgTypeBean({this.name, this.url});
}
