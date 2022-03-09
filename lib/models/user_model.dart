import 'package:json_annotation/json_annotation.dart';
import 'package:latihan_json/models/support_model.dart';

import 'data_model.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  final DataModel data;
  final SupportModel support;

  UserModel({
    required this.data,
    required this.support,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
