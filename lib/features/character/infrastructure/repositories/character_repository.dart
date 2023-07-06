import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/config/config.dart';
import 'package:rick_and_morty/enums/network_mode.dart';
import 'package:rick_and_morty/features/character/domain/interfaces/character_proverder_interface.dart';
import 'package:rick_and_morty/features/character/domain/interfaces/character_repository_interface.dart';
import 'package:rick_and_morty/features/character/domain/interfaces/character_response_dto_interface.dart';
import 'package:rick_and_morty/features/character/domain/models/character_model.dart';
import 'package:rick_and_morty/features/character/infrastructure/data-sources/character_api_provider.dart';
import 'package:rick_and_morty/features/character/infrastructure/data-sources/character_local_provider.dart';

@Injectable(as: ICharacterRepository)
class CharacterApiRepository implements ICharacterRepository {
  CharacterApiRepository(this._config, this._apiProvider, this._localProvider);

  final AppConfig _config;

  final CharacterApiProvider _apiProvider;
  final CharacterLocalProvider _localProvider;

  ICharacterProvider get _provider =>
      switch (_config.networkMode) { NetworkMode.api => _apiProvider, NetworkMode.local => _localProvider };

  String? _nextPage;
  String? _prevPage;

  @override
  Future<List<Character>> getCharacters({String? name, String? status, String? species, String? gender}) async {
    return _getCharactersWrapper(
        () => _provider.getCharacters(name: name, status: status, species: species, gender: gender));
  }

  @override
  Future<List<Character>> getNextPage() async {
    final page = _nextPage;
    if (page == null) return [];

    return _getCharactersWrapper(() => _provider.getNextPage(page));
  }

  @override
  Future<List<Character>> getPrevPage() async {
    final page = _prevPage;
    if (page == null) return [];

    return _getCharactersWrapper(() => _provider.getPrevPage(page));
  }

  Future<List<Character>> _getCharactersWrapper(Future<ICharacterResponseDto> Function() action) async {
    final response = await action();
    var results = response.results;

    _updatePaginationPages(response);
    results = _updateFavoritesFrom(results);
    _updateLocal(results);

    return results;
  }

  List<Character> _updateFavoritesFrom(List<Character> characters) {
    final localFavorites = _localProvider.getAllFavoriteCharacters();
    final localFavoritesIds = localFavorites.map((e) => e.id).toSet();

    return [...characters.where((e) => !localFavoritesIds.contains(e.id)).toList(), ...localFavorites];
  }

  void _updateLocal(List<Character> characters) {
    if (_config.networkMode == NetworkMode.api) {
      _localProvider.putAllCharacters(characters);
    }
  }

  void _updatePaginationPages(ICharacterResponseDto response) {
    _nextPage = response.info.next;
    _prevPage = response.info.prev;
  }

  @override
  Future<Character> changeIsFavorite(Character character) async {
    final updatedCharacter = character.copyWith(isFavorite: !character.isFavorite);
    _localProvider.putCharacter(updatedCharacter);

    return updatedCharacter;
  }
}
