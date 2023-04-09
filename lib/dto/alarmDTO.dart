import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
import 'package:alarmkeyword/dto/selected_time.dart';

part 'alarmDTO.g.dart';

@JsonSerializable(includeIfNull: false)
class AlarmDTO {

  int? id;
  String? userId;
  String keyword;
  String siteUrl;
  String description;
  SelectedTime refeshTime;
  bool vbEnabled;
  DateTime? createdDate;
  DateTime? crawlingDate;

  AlarmDTO({this.id,
    this.userId,
    required this.keyword,
    required this.siteUrl,
    required this.description,
    required this.refeshTime,
    required this.vbEnabled,
    this.createdDate,
    required this.crawlingDate});

  factory AlarmDTO.fromJson(Map<String, dynamic> json) =>
      _$AlarmDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AlarmDTOToJson(this);


}
