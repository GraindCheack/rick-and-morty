import 'package:rick_and_morty/features/character/domain/interfaces/character_response_dto_interface.dart';

abstract interface class ICharacterProvider {
  Future<ICharacterResponseDto> getCharacters({String? name, String? status, String? species, String? gender});

  Future<ICharacterResponseDto> getNextPage(String path);
  Future<ICharacterResponseDto> getPrevPage(String path);
}
