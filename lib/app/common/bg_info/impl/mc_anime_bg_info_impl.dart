import '../bg_info.dart';

class McAnimeBgInfoImpl implements BgInfo{
  @override
  Future<BgInfoBean> getBgInfo() async{

    String mcAnime = "https://api.ixiaowai.cn/mcapi/mcapi.php" + "?${DateTime.now().toIso8601String()}";
    BgInfoBean bgInfoBean = BgInfoBean()
      ..picUrl = mcAnime
      ..picName = "MC动漫";

    return bgInfoBean;
  }

}