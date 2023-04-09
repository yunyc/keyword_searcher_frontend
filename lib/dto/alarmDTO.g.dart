// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarmDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlarmDTO _$AlarmDTOFromJson(Map<String, dynamic> json) => AlarmDTO(
      id: json['id'] as int?,
      userId: json['userId'] as String?,
      keyword: json['keyword'] as String,
      siteUrl: json['siteUrl'] as String,
      description: json['description'] as String,
      refeshTime: $enumDecode(_$SelectedTimeEnumMap, json['refeshTime']),
      vbEnabled: json['vbEnabled'] as bool,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      crawlingDate: json['crawlingDate'] == null
          ? null
          : DateTime.parse(json['crawlingDate'] as String),
    );

Map<String, dynamic> _$AlarmDTOToJson(AlarmDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('userId', instance.userId);
  val['keyword'] = instance.keyword;
  val['siteUrl'] = instance.siteUrl;
  val['description'] = instance.description;
  val['refeshTime'] = _$SelectedTimeEnumMap[instance.refeshTime]!;
  val['vbEnabled'] = instance.vbEnabled;
  writeNotNull('createdDate', instance.createdDate?.toIso8601String());
  writeNotNull('crawlingDate', instance.crawlingDate?.toIso8601String());
  return val;
}

const _$SelectedTimeEnumMap = {
  SelectedTime.ONE: 'ONE',
  SelectedTime.FIVE: 'FIVE',
  SelectedTime.TEN: 'TEN',
  SelectedTime.THIRTY: 'THIRTY',
};
