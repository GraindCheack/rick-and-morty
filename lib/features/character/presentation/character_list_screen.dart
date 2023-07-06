import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_and_morty/config/config.dart';
import 'package:rick_and_morty/constants/offset_constants.dart';
import 'package:rick_and_morty/enums/network_mode.dart';
import 'package:rick_and_morty/features/character/application/state/character_state.dart';
import 'package:rick_and_morty/features/character/presentation/character_list.dart';
import 'package:rick_and_morty/features/character/presentation/character_list_filters.dart';
import 'package:rick_and_morty/features/character/presentation/character_list_header.dart';
import 'package:rick_and_morty/features/character/presentation/enums/character_list_mode_enum.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  late final CharacterState _state = GetIt.I<CharacterState>();

  final ValueNotifier<CharacterListMode> _mode = ValueNotifier(CharacterListMode.card);
  late final ValueNotifier<NetworkMode> _networkMode = ValueNotifier(GetIt.I<AppConfig>().networkMode)
    ..addListener(() {
      GetIt.I<AppConfig>().networkMode = _networkMode.value;
      _state.loadCharacters();
    });

  @override
  void initState() {
    _state.loadCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rick and Morty')),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(OffsetConstants.m),
              child: Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: _mode,
                    builder: (context, mode, child) {
                      return ValueListenableBuilder(
                        valueListenable: _networkMode,
                        builder: (context, networkMode, child) {
                          return CharacterListHeader(
                            mode: mode,
                            networkMode: networkMode,
                            onModeChanged: (mode) => _mode.value = mode,
                            onNetworkModeChanged: (mode) => _networkMode.value = mode,
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: OffsetConstants.m),
                  Observer(
                    builder: (context) => CharacterListFilters(
                      filters: _state.filters,
                      onFiltersChanged: _state.changeFilters,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Observer(
              builder: (context) => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: _state.isLoading ? 24 : 0,
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Text('Loading...', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: OffsetConstants.m),
                child: Observer(
                  builder: (context) {
                    final characters = _state.characters;
                    if (characters == null) {
                      return _state.isLoading ? const SizedBox() : const Center(child: Text('No characters'));
                    }

                    return ValueListenableBuilder(
                      valueListenable: _mode,
                      builder: (context, mode, child) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: switch (mode) {
                              CharacterListMode.card => OffsetConstants.m,
                              CharacterListMode.row => 0,
                            },
                          ),
                          child: CharacterList(
                            characters: characters,
                            addToFavorites: _state.changeIsFavorite,
                            mode: _mode.value,
                            onScrollEnd: () async {
                              if (!_state.isLoading) {
                                await _state.loadNextPage();
                                await Future.delayed(const Duration(milliseconds: 200));
                              }
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
