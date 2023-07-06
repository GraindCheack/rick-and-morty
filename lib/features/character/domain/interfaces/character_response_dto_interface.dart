import 'package:rick_and_morty/entities/rest_info.dart';
import 'package:rick_and_morty/features/character/domain/models/character_model.dart';

abstract interface class ICharacterResponseDto {
  RestInfo get info;
  List<Character> get results;
}
