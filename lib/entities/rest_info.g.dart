// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestInfo _$RestInfoFromJson(Map<String, dynamic> json) => RestInfo(
      count: json['count'] as int,
      pages: json['pages'] as int,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$RestInfoToJson(RestInfo instance) => <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };
