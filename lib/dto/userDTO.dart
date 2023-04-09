import 'package:json_annotation/json_annotation.dart';

part 'userDTO.g.dart';

@JsonSerializable()
class UserDTO {
  final int? id;
  final String? userId;
  final String? firebaseToken;

  UserDTO({
    this.id,
    this.userId,
    this.firebaseToken,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}
