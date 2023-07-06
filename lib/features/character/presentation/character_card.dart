import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/offset_constants.dart';
import 'package:rick_and_morty/features/character/domain/models/character_model.dart';
import 'package:rick_and_morty/features/character/presentation/character_details.dart';
import 'package:rick_and_morty/features/character/presentation/character_status.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.character, this.addToFavorites});

  final Character character;
  final void Function(Character character)? addToFavorites;

  static const _cardHeight = 120.0;
  static const _borderRadius = 16.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius)),
      child: Stack(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => CharacterDetails(character: character)),
            ),
            child: SizedBox(
              height: _cardHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.horizontal(left: Radius.circular(_borderRadius)),
                    child: Image.network(character.image, fit: BoxFit.fitHeight),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(OffsetConstants.m),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CharacterStatusIcon(status: character.status),
                              const SizedBox(width: OffsetConstants.xs),
                              Expanded(child: Text(character.name, style: Theme.of(context).textTheme.titleMedium)),
                            ],
                          ),
                          const SizedBox(height: OffsetConstants.xs),
                          Text('${character.species} - ${character.status}')
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: TextButton(
              onPressed: () => addToFavorites?.call(character),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(OffsetConstants.s),
                shape: const CircleBorder(),
                minimumSize: Size.zero,
              ),
              child: Text(
                character.isFavorite ? '􀋃' : '􀋂',
                style: const TextStyle(fontFamily: 'SF Pro', fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
    /* return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => CharacterDetails(character: character)),
      ),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(character.image)),
        trailing: TextButton(
          onPressed: () => addToFavorites?.call(character),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(OffsetConstants.s),
            shape: const CircleBorder(),
            minimumSize: Size.zero,
          ),
          child: Text(
            character.isFavorite ? '􀋃' : '􀋂',
            style: const TextStyle(fontFamily: 'SF Pro', fontSize: 16),
          ),
        ),
        title: Text.rich(
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
              TextSpan(text: character.name),
            ],
          ),
        ),
        subtitle: Text('${character.species} - ${character.status}'),
      ),
    ); */
  }
}
