// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'package:rick_and_morty/features/character/domain/enums/character_gender_enum.dart';
import 'package:rick_and_morty/features/character/domain/enums/character_status_enum.dart';

part 'character_model.g.dart';

@JsonSerializable()
@collection
class Character {
  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
    required this.isFavorite,
  });

  final Id id;

  final String name;

  @enumerated
  @JsonKey(fromJson: _statusFromJson)
  final CharacterStatus status;

  @enumerated
  @JsonKey(fromJson: _genderFromJson)
  final CharacterGender gender;

  final String species;
  final String type;

  @JsonKey(fromJson: _namedEntityFromJson)
  final String origin;
  @JsonKey(fromJson: _namedEntityFromJson)
  final String location;
  final String image;

  @JsonKey(defaultValue: false)
  final bool isFavorite;

  final List<String> episode;
  final String url;

  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  final DateTime created;

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  static DateTime _dateTimeFromJson(String value) => DateTime.parse(value);
  static String _dateTimeToJson(DateTime value) => value.toIso8601String();

  static String _namedEntityFromJson(Map<String, dynamic> value) => value['name'] as String;

  static CharacterGender _genderFromJson(String value) => CharacterGender.fromName(value);
  static CharacterStatus _statusFromJson(String value) => CharacterStatus.fromName(value);

  Character copyWith({
    Id? id,
    String? name,
    CharacterStatus? status,
    CharacterGender? gender,
    String? species,
    String? type,
    String? origin,
    String? location,
    String? image,
    bool? isFavorite,
    List<String>? episode,
    String? url,
    DateTime? created,
  }) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      gender: gender ?? this.gender,
      species: species ?? this.species,
      type: type ?? this.type,
      origin: origin ?? this.origin,
      location: location ?? this.location,
      image: image ?? this.image,
      isFavorite: isFavorite ?? this.isFavorite,
      episode: episode ?? this.episode,
      url: url ?? this.url,
      created: created ?? this.created,
    );
  }
}
