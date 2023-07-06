import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/character/domain/enums/character_status_enum.dart';

class CharacterStatusIcon extends StatelessWidget {
  const CharacterStatusIcon({super.key, required this.status});
  final CharacterStatus status;

  @override
  Widget build(BuildContext context) {
    return Text(
      '􀀀',
      style: TextStyle(
        fontFamily: 'SF Pro',
        fontWeight: FontWeight.w900,
        color: switch (status) {
          CharacterStatus.alive => Colors.green,
          CharacterStatus.dead => Colors.red,
          CharacterStatus.unknown => Colors.grey,
        },
      ),
    );
  }
}
