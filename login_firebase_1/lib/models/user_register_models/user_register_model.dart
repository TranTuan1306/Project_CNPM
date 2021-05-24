import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_register_model.g.dart';

@JsonSerializable()
class UserRegisterModel {
  String id;
  String name;
  String password;
  String email;

  UserRegisterModel({
    this.id,
    @required this.name,
    @required this.email,
    @required this.password,
  });
  factory UserRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserRegisterModelToJson(this);
}
