import 'package:json_annotation/json_annotation.dart';

part 'test_bean.g.dart';


@JsonSerializable()
class TestBean extends Object {

  @JsonKey(name: 'firstName')
  String firstName;

  @JsonKey(name: 'lastName')
  String lastName;

  @JsonKey(name: 'people')
  List<People> people;

  TestBean(this.firstName,this.lastName,this.people,);

  factory TestBean.fromJson(Map<String, dynamic> srcJson) => _$TestBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TestBeanToJson(this);

}


@JsonSerializable()
class People extends Object {

  @JsonKey(name: 'firstName')
  String firstName;

  @JsonKey(name: 'lastName')
  String lastName;

  @JsonKey(name: 'email')
  String email;

  People(this.firstName,this.lastName,this.email,);

  factory People.fromJson(Map<String, dynamic> srcJson) => _$PeopleFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PeopleToJson(this);

}


