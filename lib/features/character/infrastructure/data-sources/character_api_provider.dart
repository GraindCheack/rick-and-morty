import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty/features/character/domain/interfaces/character_proverder_interface.dart';
import 'package:rick_and_morty/features/character/infrastructure/data-transfers/character_response_dto.dart';

part 'character_api_provider.g.dart';

@injectable
class CharacterApiProvider extends _CharacterApiProviderBase {
  CharacterApiProvider(super.dio);
}

@RestApi()
abstract class CharacterApiProviderBase implements ICharacterProvider {
  factory CharacterApiProviderBase(Dio dio, {String baseUrl}) = _CharacterApiProviderBase;

  @override
  @GET("/character")
  Future<CharacterResponseDto> getCharacters({
    @Query("name") String? name,
    @Query("status") String? status,
    @Query("species") String? species,
    @Query("gender") String? gender,
  });

  @override
  @GET("{path}")
  Future<CharacterResponseDto> getNextPage(@Path("path") String path);

  @override
  @GET("{path}")
  Future<CharacterResponseDto> getPrevPage(@Path("path") String path);
}
