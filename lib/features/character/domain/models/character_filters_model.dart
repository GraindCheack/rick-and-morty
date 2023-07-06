import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/features/character/domain/enums/character_gender_enum.dart';
import 'package:rick_and_morty/features/character/domain/enums/character_status_enum.dart';

part 'character_filters_model.freezed.dart';

@freezed
class CharacterFilters with _$CharacterFilters {
  const factory CharacterFilters({
    String? name,
    CharacterStatus? status,
    String? species,
    CharacterGender? gender,
  }) = _CharacterFilters;
}
