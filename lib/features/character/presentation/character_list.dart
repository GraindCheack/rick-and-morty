import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/offset_constants.dart';
import 'package:rick_and_morty/features/character/domain/models/character_model.dart';
import 'package:rick_and_morty/features/character/presentation/character_card.dart';
import 'package:rick_and_morty/features/character/presentation/character_row.dart';
import 'package:rick_and_morty/features/character/presentation/enums/character_list_mode_enum.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({
    super.key,
    required this.characters,
    this.onScrollEnd,
    this.addToFavorites,
    this.mode = CharacterListMode.card,
  });

  final List<Character> characters;
  final CharacterListMode mode;

  final Function()? onScrollEnd;
  final void Function(Character character)? addToFavorites;

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  final ValueNotifier<bool> _canScrollUp = ValueNotifier(false);

  static const _scrollEndBreakPointRatio = 0.95;

  bool _isScrollEndCallbackRun = false;
  late final ScrollController _scrollController = ScrollController()
    ..addListener(() async {
      _canScrollUp.value = _scrollController.offset > 0;
      if (_scrollController.offset / _scrollController.position.maxScrollExtent > _scrollEndBreakPointRatio &&
          !_isScrollEndCallbackRun) {
        _isScrollEndCallbackRun = true;

        await widget.onScrollEnd?.call();

        _isScrollEndCallbackRun = false;
      }
    });

  @override
  Widget build(BuildContext context) {
    final sortedCharacters = [...widget.characters]..sort((a, b) => a.isFavorite ? -1 : 1);
    return Stack(
      children: [
        ListView.separated(
          controller: _scrollController,
          itemCount: sortedCharacters.length,
          padding: const EdgeInsets.only(bottom: OffsetConstants.m),
          separatorBuilder: (context, index) => switch (widget.mode) {
            CharacterListMode.card => const SizedBox(height: OffsetConstants.s),
            CharacterListMode.row => const Divider(height: 1),
          },
          itemBuilder: (context, index) {
            final character = sortedCharacters[index];
            return switch (widget.mode) {
              CharacterListMode.card => CharacterCard(character: character, addToFavorites: widget.addToFavorites),
              CharacterListMode.row => CharacterRow(character: character, addToFavorites: widget.addToFavorites),
            };
          },
        ),
        ValueListenableBuilder(
          valueListenable: _canScrollUp,
          child: FilledButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(OffsetConstants.s),
              shape: const CircleBorder(),
              minimumSize: Size.zero,
            ),
            onPressed: () => _scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
            child: const Text('􀄨', style: TextStyle(fontFamily: 'SF Pro')),
          ),
          builder: (context, canScrollUp, child) {
            return AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              bottom: canScrollUp ? OffsetConstants.m : -OffsetConstants.xl,
              right: OffsetConstants.m,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: canScrollUp ? 1 : 0,
                child: child ?? const SizedBox(),
              ),
            );
          },
        ),
      ],
    );
  }
}
