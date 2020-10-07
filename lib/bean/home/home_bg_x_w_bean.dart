import 'package:json_annotation/json_annotation.dart';

part 'home_bg_x_w_bean.g.dart';

@JsonSerializable()
class HomeBgXWBean extends Object {
  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'imgurl')
  String imgurl;

  @JsonKey(name: 'width')
  String width;

  @JsonKey(name: 'height')
  String height;

  HomeBgXWBean(
    this.code,
    this.imgurl,
    this.width,
    this.height,
  );

  factory HomeBgXWBean.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeBgXWBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeBgXWBeanToJson(this);
}
