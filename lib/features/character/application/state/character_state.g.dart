// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterState on CharacterBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'CharacterBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'CharacterBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$filtersAtom =
      Atom(name: 'CharacterBase.filters', context: context);

  @override
  CharacterFilters get filters {
    _$filtersAtom.reportRead();
    return super.filters;
  }

  @override
  set filters(CharacterFilters value) {
    _$filtersAtom.reportWrite(value, super.filters, () {
      super.filters = value;
    });
  }

  late final _$charactersAtom =
      Atom(name: 'CharacterBase.characters', context: context);

  @override
  ObservableList<Character>? get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character>? value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$loadCharactersAsyncAction =
      AsyncAction('CharacterBase.loadCharacters', context: context);

  @override
  Future<void> loadCharacters() {
    return _$loadCharactersAsyncAction.run(() => super.loadCharacters());
  }

  late final _$loadNextPageAsyncAction =
      AsyncAction('CharacterBase.loadNextPage', context: context);

  @override
  Future<void> loadNextPage() {
    return _$loadNextPageAsyncAction.run(() => super.loadNextPage());
  }

  late final _$changeIsFavoriteAsyncAction =
      AsyncAction('CharacterBase.changeIsFavorite', context: context);

  @override
  Future<Character> changeIsFavorite(Character character) {
    return _$changeIsFavoriteAsyncAction
        .run(() => super.changeIsFavorite(character));
  }

  late final _$_loadingWrapperAsyncAction =
      AsyncAction('CharacterBase._loadingWrapper', context: context);

  @override
  Future<void> _loadingWrapper(Future<dynamic> Function() action) {
    return _$_loadingWrapperAsyncAction
        .run(() => super._loadingWrapper(action));
  }

  late final _$CharacterBaseActionController =
      ActionController(name: 'CharacterBase', context: context);

  @override
  void changeFilters(CharacterFilters filters) {
    final _$actionInfo = _$CharacterBaseActionController.startAction(
        name: 'CharacterBase.changeFilters');
    try {
      return super.changeFilters(filters);
    } finally {
      _$CharacterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
filters: ${filters},
characters: ${characters}
    ''';
  }
}
