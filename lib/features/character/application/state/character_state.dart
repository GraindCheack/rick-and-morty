import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_and_morty/features/character/domain/interfaces/character_repository_interface.dart';
import 'package:rick_and_morty/features/character/domain/models/character_filters_model.dart';
import 'package:rick_and_morty/features/character/domain/models/character_model.dart';

part 'character_state.g.dart';

@injectable
class CharacterState extends CharacterBase with _$CharacterState {
  CharacterState(super.service);
}

abstract class CharacterBase with Store {
  CharacterBase(this._repository);

  final ICharacterRepository _repository;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  CharacterFilters filters = const CharacterFilters();

  @observable
  ObservableList<Character>? characters;

  @action
  Future<void> loadCharacters() async {
    await _loadingWrapper(
      () async => characters = ObservableList.of(
        await _repository.getCharacters(
          name: filters.name,
          species: filters.species,
          status: filters.status?.name.toLowerCase(),
          gender: filters.gender?.name.toLowerCase(),
        ),
      ),
    );
  }

  @action
  Future<void> loadNextPage() async {
    if (isLoading) return;

    await _loadingWrapper(
      () async {
        final newCharacters = await _repository.getNextPage();
        final newCharactersIds = newCharacters.map((c) => c.id).toList();

        characters = ObservableList.of(
          [...(characters ?? []).where((c) => !newCharactersIds.contains(c.id)), ...newCharacters],
        );
      },
    );
  }

  @action
  void changeFilters(CharacterFilters filters) {
    this.filters = filters;
    loadCharacters();
  }

  @action
  Future<Character> changeIsFavorite(Character character) async {
    final updatedCharacter = await _repository.changeIsFavorite(character);

    final localCharacters = characters;
    if (localCharacters != null) {
      characters = ObservableList.of(localCharacters.map((c) => c.id == updatedCharacter.id ? updatedCharacter : c));
    }

    return updatedCharacter;
  }

  @action
  Future<void> _loadingWrapper(Future Function() action) async {
    isLoading = true;

    try {
      await action();
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
  }
}
