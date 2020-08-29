
import '../bg_info.dart';

class AnimeBgInfoImpl implements BgInfo{
  @override
  Future<BgInfoBean> getBgInfo() async{


    String animeUrl = "https://api.ixiaowai.cn/api/api.php" + "?${DateTime.now().toIso8601String()}";
    BgInfoBean bgInfoBean = BgInfoBean()
      ..picUrl = animeUrl
      ..picName = "二次元动漫";

    return bgInfoBean;
  }

}