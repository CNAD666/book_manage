import '../bg_info.dart';

class HdSightsBgInfoImpl implements BgInfo{
  @override
  Future<BgInfoBean> getBgInfo() async{

    String hdSights = "https://api.ixiaowai.cn/gqapi/gqapi.php" + "?${DateTime.now().toIso8601String()}";
    BgInfoBean bgInfoBean = BgInfoBean()
      ..picUrl = hdSights
      ..picName = "高清风景";

    return bgInfoBean;
  }

}