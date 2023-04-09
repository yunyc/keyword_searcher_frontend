// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noticeDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeDTO _$NoticeDTOFromJson(Map<String, dynamic> json) => NoticeDTO(
      id: json['id'] as int?,
      content: json['content'] as String,
      siteUrl: json['siteUrl'] as String,
      saveEnabled: json['saveEnabled'] as bool,
      visiabled: json['visiabled'] as bool,
      crawledDate: DateTime.parse(json['crawledDate'] as String),
    );

Map<String, dynamic> _$NoticeDTOToJson(NoticeDTO instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'siteUrl': instance.siteUrl,
      'saveEnabled': instance.saveEnabled,
      'visiabled': instance.visiabled,
      'crawledDate': instance.crawledDate.toIso8601String(),
    };
