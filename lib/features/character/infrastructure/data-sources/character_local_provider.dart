import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:rick_and_morty/entities/rest_info.dart';
import 'package:rick_and_morty/features/character/domain/enums/character_gender_enum.dart';
import 'package:rick_and_morty/features/character/domain/enums/character_status_enum.dart';
import 'package:rick_and_morty/features/character/domain/interfaces/character_proverder_interface.dart';
import 'package:rick_and_morty/features/character/domain/models/character_model.dart';
import 'package:rick_and_morty/features/character/infrastructure/data-transfers/character_response_dto.dart';

@injectable
class CharacterLocalProvider implements ICharacterProvider {
  const CharacterLocalProvider(this._isar);
  final Isar _isar;

  @override
  Future<CharacterResponseDto> getCharacters({String? name, String? status, String? species, String? gender}) async {
    final query = _isar.characters
        .filter()
        .optional(name != null, (q) => q.nameContains(name ?? ''))
        .optional(status != null, (q) => q.statusEqualTo(CharacterStatus.fromName(status)))
        .optional(species != null, (q) => q.speciesContains(species ?? ''))
        .optional(gender != null, (q) => q.genderEqualTo(CharacterGender.fromName(gender)));

    return CharacterResponseDto(
      results: query.findAllSync(),
      info: RestInfo(count: query.countSync(), pages: 1),
    );
  }

  void putAllCharacters(List<Character> characters) {
    _isar.writeTxnSync(() async => _isar.characters.putAllSync(characters));
  }

  Future<void> putCharacter(Character character) async {
    await _isar.writeTxn(() => _isar.characters.put(character));
  }

  List<Character?> getAllCharactersByIds(List<int> ids) {
    return _isar.characters.getAllSync(ids);
  }

  List<Character> getAllFavoriteCharacters() {
    return _isar.characters.filter().isFavoriteEqualTo(true).findAllSync();
  }

  @override
  Future<CharacterResponseDto> getNextPage(String path) async {
    return const CharacterResponseDto.empty();
  }

  @override
  Future<CharacterResponseDto> getPrevPage(String path) async {
    return const CharacterResponseDto.empty();
  }
}
