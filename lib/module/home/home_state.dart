import 'package:book_web/http/pic_url.dart';
import 'package:book_web/views/common/bg_info/bg_info.dart';

class HomeState {
  ///是否出入loading状态
  bool isLoading;

  ///背景类型  二次元动漫   mc动漫  高清风景
  List<BgInfoBean> bgInfoList;

  ///被选择的背景
  BgInfoBean selectedBgType;

  ///缓存上一张背景数据
  String lastBgUrl;

  ///是否隐藏控件
  bool isHide;

  HomeState init() {
    return HomeState()
      ..isLoading = false
      ..bgInfoList = []
      ..selectedBgType = BgInfoBean(picUrl: PicUrl.PIC_ANIME)
      ..lastBgUrl = ""
      ..isHide = false;
  }

  ///创建克隆对象方法
  HomeState clone() {
    return HomeState()
      ..isLoading = isLoading
      ..selectedBgType = selectedBgType
      ..lastBgUrl = lastBgUrl
      ..isHide = isHide
      ..bgInfoList = bgInfoList;
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
