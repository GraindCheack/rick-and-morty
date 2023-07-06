// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterResponseDto _$CharacterResponseDtoFromJson(
        Map<String, dynamic> json) =>
    CharacterResponseDto(
      results: (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
      info: RestInfo.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharacterResponseDtoToJson(
        CharacterResponseDto instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
