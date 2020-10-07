// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bg_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBgBean _$HomeBgBeanFromJson(Map<String, dynamic> json) {
  return HomeBgBean(
    json['error'] as int,
    json['result'] as int,
    json['img'] as String,
  );
}

Map<String, dynamic> _$HomeBgBeanToJson(HomeBgBean instance) =>
    <String, dynamic>{
      'error': instance.error,
      'result': instance.result,
      'img': instance.img,
    };
