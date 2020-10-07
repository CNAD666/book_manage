// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestBean _$TestBeanFromJson(Map<String, dynamic> json) {
  return TestBean(
    json['firstName'] as String,
    json['lastName'] as String,
    (json['people'] as List)
        ?.map((e) =>
            e == null ? null : People.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TestBeanToJson(TestBean instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'people': instance.people,
    };

People _$PeopleFromJson(Map<String, dynamic> json) {
  return People(
    json['firstName'] as String,
    json['lastName'] as String,
    json['email'] as String,
  );
}

Map<String, dynamic> _$PeopleToJson(People instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
    };
