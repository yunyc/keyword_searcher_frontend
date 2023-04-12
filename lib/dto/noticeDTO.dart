import 'package:json_annotation/json_annotation.dart';

part 'noticeDTO.g.dart';

@JsonSerializable()
class NoticeDTO {
  int? id;
  String content;
  String siteUrl;
  bool visiabled;
  DateTime crawledDate;

  NoticeDTO({
    this.id,
    required this.content,
    required this.siteUrl,
    required this.visiabled,
    required this.crawledDate,
  });

  factory NoticeDTO.fromJson(Map<String, dynamic> json) =>
      _$NoticeDTOFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeDTOToJson(this);
}