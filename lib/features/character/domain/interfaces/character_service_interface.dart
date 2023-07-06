import 'package:rick_and_morty/enums/network_mode.dart';
import 'package:rick_and_morty/features/character/domain/models/character_model.dart';

abstract interface class ICharacterService {
  Future<List<Character>> getCharactersByMode(NetworkMode mode,
      {String? name, String? status, String? species, String? type, String? gender});

  Future<List<Character>> getNextPageByMode(NetworkMode mode);
  Future<List<Character>> getPrevPageByMode(NetworkMode mode);
}
