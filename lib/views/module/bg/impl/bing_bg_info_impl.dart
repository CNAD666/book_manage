import 'dart:convert';
import 'package:dio/dio.dart';
import '../bg_info.dart';

class BingBgInfoImpl implements BgInfo{
  @override
  Future<BgInfoBean> getBgInfo() async{
    String host = "https://cn.bing.com";
    String api = host +  "/HPImageArchive.aspx";

    Map<String, dynamic> queryMap = {
      //返回数据格式，不存在返回xml格式js (一般使用这个，返回json格式)xml（返回xml格式）
      "format": "js",
      //请求图片截止天数0 今天-1 截止中明天 （预准备的）1 截止至昨天，类推（目前最多获取到7天前的图片）
      "idx": 0,
      //1-8 返回请求数量，目前最多一次获取8张
      "n": 1,
      //地区zh-CN
      "mkt": "zh-CN",
    };

    print(api);
    Options options = Options()
      ..responseType = ResponseType.plain;
    Response response = await Dio().get(api, queryParameters: queryMap, options: options);
    BingBgInfoBean bingBgInfoBean = BingBgInfoBean.fromJson(json.decode(response.toString()));
    print(response.toString());

    return BgInfoBean()
        ..picUrl = host +  bingBgInfoBean.images[0].url;
  }

}



///Bing背景实体
class BingBgInfoBean {
  List<Images> images;
  Tooltips tooltips;

  BingBgInfoBean({this.images, this.tooltips});

  BingBgInfoBean.fromJson(Map<String, dynamic> json) {
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    tooltips = json['tooltips'] != null
        ? new Tooltips.fromJson(json['tooltips'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    if (this.tooltips != null) {
      data['tooltips'] = this.tooltips.toJson();
    }
    return data;
  }
}

class Images {
  String startdate;
  String fullstartdate;
  String enddate;
  String url;
  String urlbase;
  String copyright;
  String copyrightlink;
  String title;
  String quiz;
  bool wp;
  String hsh;
  int drk;
  int top;
  int bot;
  List<dynamic> hs;

  Images(
      {this.startdate,
        this.fullstartdate,
        this.enddate,
        this.url,
        this.urlbase,
        this.copyright,
        this.copyrightlink,
        this.title,
        this.quiz,
        this.wp,
        this.hsh,
        this.drk,
        this.top,
        this.bot,
        this.hs});

  Images.fromJson(Map<String, dynamic> json) {
    startdate = json['startdate'];
    fullstartdate = json['fullstartdate'];
    enddate = json['enddate'];
    url = json['url'];
    urlbase = json['urlbase'];
    copyright = json['copyright'];
    copyrightlink = json['copyrightlink'];
    title = json['title'];
    quiz = json['quiz'];
    wp = json['wp'];
    hsh = json['hsh'];
    drk = json['drk'];
    top = json['top'];
    bot = json['bot'];
    hs = json['hs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startdate'] = this.startdate;
    data['fullstartdate'] = this.fullstartdate;
    data['enddate'] = this.enddate;
    data['url'] = this.url;
    data['urlbase'] = this.urlbase;
    data['copyright'] = this.copyright;
    data['copyrightlink'] = this.copyrightlink;
    data['title'] = this.title;
    data['quiz'] = this.quiz;
    data['wp'] = this.wp;
    data['hsh'] = this.hsh;
    data['drk'] = this.drk;
    data['top'] = this.top;
    data['bot'] = this.bot;
    data['hs'] = this.hs;
    return data;
  }
}

class Tooltips {
  String loading;
  String previous;
  String next;
  String walle;
  String walls;

  Tooltips({this.loading, this.previous, this.next, this.walle, this.walls});

  Tooltips.fromJson(Map<String, dynamic> json) {
    loading = json['loading'];
    previous = json['previous'];
    next = json['next'];
    walle = json['walle'];
    walls = json['walls'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loading'] = this.loading;
    data['previous'] = this.previous;
    data['next'] = this.next;
    data['walle'] = this.walle;
    data['walls'] = this.walls;
    return data;
  }
}
