// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      id: json['id'] as int?,
      userId: json['userId'] as String?,
      firebaseToken: json['firebaseToken'] as String?,
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'firebaseToken': instance.firebaseToken,
    };
