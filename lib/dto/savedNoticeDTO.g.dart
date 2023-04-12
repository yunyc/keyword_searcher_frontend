// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savedNoticeDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedNoticeDTO _$SavedNoticeDTOFromJson(Map<String, dynamic> json) =>
    SavedNoticeDTO(
      id: json['id'] as int?,
      content: json['content'] as String,
      siteUrl: json['siteUrl'] as String,
      noticeId: json['noticeId'] as int,
      crawledDate: DateTime.parse(json['crawledDate'] as String),
    );

Map<String, dynamic> _$SavedNoticeDTOToJson(SavedNoticeDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'siteUrl': instance.siteUrl,
      'crawledDate': instance.crawledDate.toIso8601String(),
      'noticeId': instance.noticeId,
    };
