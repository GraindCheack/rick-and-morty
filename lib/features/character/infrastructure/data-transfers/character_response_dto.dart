import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/entities/rest_info.dart';
import 'package:rick_and_morty/features/character/domain/interfaces/character_response_dto_interface.dart';
import 'package:rick_and_morty/features/character/domain/models/character_model.dart';

part 'character_response_dto.g.dart';

@JsonSerializable()
class CharacterResponseDto implements ICharacterResponseDto {
  @override
  final RestInfo info;
  @override
  final List<Character> results;

  const CharacterResponseDto({
    required this.results,
    required this.info,
  });

  const CharacterResponseDto.empty() : this(results: const [], info: const RestInfo.empty());

  factory CharacterResponseDto.fromJson(Map<String, dynamic> json) => _$CharacterResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterResponseDtoToJson(this);
}
