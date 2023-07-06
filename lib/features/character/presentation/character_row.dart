import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/offset_constants.dart';
import 'package:rick_and_morty/features/character/domain/models/character_model.dart';
import 'package:rick_and_morty/features/character/presentation/character_details.dart';
import 'package:rick_and_morty/features/character/presentation/character_status.dart';

class CharacterRow extends StatelessWidget {
  const CharacterRow({super.key, required this.character, this.addToFavorites});

  final Character character;
  final void Function(Character character)? addToFavorites;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
        title: Row(
          children: [
            CharacterStatusIcon(status: character.status),
            const SizedBox(width: OffsetConstants.xs),
            Expanded(child: Text(character.name)),
          ],
        ),
        subtitle: Text('${character.species} - ${character.status}'),
      ),
    );
  }
}
