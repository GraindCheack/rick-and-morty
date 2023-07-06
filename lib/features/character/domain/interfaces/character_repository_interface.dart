import 'package:rick_and_morty/features/character/domain/models/character_model.dart';

abstract interface class ICharacterRepository {
  Future<List<Character>> getCharacters({String? name, String? status, String? species, String? gender});
  Future<List<Character>> getNextPage();
  Future<List<Character>> getPrevPage();
  Future<Character> changeIsFavorite(Character character);
}
