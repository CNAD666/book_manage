import 'package:json_annotation/json_annotation.dart';

part 'home_bg_bean.g.dart';

@JsonSerializable()
class HomeBgBean extends Object {
  @JsonKey(name: 'error')
  int error;

  @JsonKey(name: 'result')
  int result;

  @JsonKey(name: 'img')
  String img;

  HomeBgBean(
    this.error,
    this.result,
    this.img,
  );

  factory HomeBgBean.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeBgBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeBgBeanToJson(this);
}
