import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/offset_constants.dart';
import 'package:rick_and_morty/enums/network_mode.dart';
import 'package:rick_and_morty/features/character/presentation/enums/character_list_mode_enum.dart';

class CharacterListHeader extends StatelessWidget {
  const CharacterListHeader({
    super.key,
    this.mode = CharacterListMode.card,
    this.networkMode = NetworkMode.api,
    this.onModeChanged,
    this.onNetworkModeChanged,
  });

  final CharacterListMode mode;
  final NetworkMode networkMode;

  final void Function(CharacterListMode mode)? onModeChanged;
  final void Function(NetworkMode mode)? onNetworkModeChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SegmentedButton(
          segments: [
            ButtonSegment(
              value: CharacterListMode.card,
              label: Text(CharacterListMode.card.name),
              icon: const Text('􀏃', style: TextStyle(fontFamily: 'SF Pro')),
            ),
            ButtonSegment(
              value: CharacterListMode.row,
              label: Text(CharacterListMode.row.name),
              icon: const Text('􀌇', style: TextStyle(fontFamily: 'SF Pro')),
            ),
          ],
          selected: {mode},
          onSelectionChanged: (mode) => onModeChanged?.call(mode.first),
        ),
        const SizedBox(width: OffsetConstants.m),
        SegmentedButton(
          segments: [
            ButtonSegment(
              value: NetworkMode.api,
              label: Text(NetworkMode.api.name),
              icon: const Text('􀤆', style: TextStyle(fontFamily: 'SF Pro')),
            ),
            ButtonSegment(
              value: NetworkMode.local,
              label: Text(NetworkMode.local.name),
              icon: const Text('􀜍', style: TextStyle(fontFamily: 'SF Pro')),
            ),
          ],
          selected: {networkMode},
          onSelectionChanged: (mode) => onNetworkModeChanged?.call(mode.first),
        ),
      ],
    );
  }
}
