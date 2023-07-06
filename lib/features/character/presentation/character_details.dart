import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/offset_constants.dart';
import 'package:rick_and_morty/features/character/domain/enums/character_status_enum.dart';
import 'package:rick_and_morty/features/character/domain/models/character_model.dart';

class CharacterDetails extends StatelessWidget {
  const CharacterDetails({super.key, required this.character});
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
              child: Image.network(
                character.image,
                alignment: Alignment.topRight,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(OffsetConstants.xs),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(OffsetConstants.s),
                            shape: const CircleBorder(),
                            minimumSize: Size.zero,
                          ),
                          child: const Text('􀄪', style: TextStyle(fontFamily: 'SF Pro', fontSize: 16)),
                        ),
                        const SizedBox(width: OffsetConstants.xs),
                        Text(character.name, style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(OffsetConstants.xl).copyWith(top: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(character.gender.toString(), style: Theme.of(context).textTheme.labelLarge),
                        const SizedBox(height: OffsetConstants.xs),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '􀀀 ',
                                style: TextStyle(
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w900,
                                  color: switch (character.status) {
                                    CharacterStatus.alive => Colors.green,
                                    CharacterStatus.dead => Colors.red,
                                    CharacterStatus.unknown => Colors.grey,
                                  },
                                ),
                              ),
                              TextSpan(
                                  text: character.status.toString(), style: Theme.of(context).textTheme.labelLarge),
                            ],
                          ),
                        ),
                        const SizedBox(height: OffsetConstants.xs),
                        Text('Last known location: ${character.location}'),
                        const SizedBox(height: OffsetConstants.xs),
                        Text('Origin: ${character.origin}'),
                        const SizedBox(height: OffsetConstants.xs),
                        Text('Species: ${character.species}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
