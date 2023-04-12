import 'package:alarmkeyword/dto/noticeDTO.dart';
import 'package:json_annotation/json_annotation.dart';

part 'savedNoticeDTO.g.dart';

@JsonSerializable()
class SavedNoticeDTO {
  int? id;
  String content;
  String siteUrl;
  DateTime crawledDate;
  int noticeId;

  SavedNoticeDTO({
    this.id,
    required this.content,
    required this.siteUrl,
    required this.noticeId,
    required this.crawledDate,
  });

  factory SavedNoticeDTO.fromJson(Map<String, dynamic> json) =>
      _$SavedNoticeDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SavedNoticeDTOToJson(this);
}