// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i5;
import 'package:rick_and_morty/config/config.dart' as _i3;
import 'package:rick_and_morty/features/character/application/state/character_state.dart'
    as _i10;
import 'package:rick_and_morty/features/character/domain/interfaces/character_repository_interface.dart'
    as _i8;
import 'package:rick_and_morty/features/character/infrastructure/data-sources/character_api_provider.dart'
    as _i6;
import 'package:rick_and_morty/features/character/infrastructure/data-sources/character_local_provider.dart'
    as _i7;
import 'package:rick_and_morty/features/character/infrastructure/repositories/character_repository.dart'
    as _i9;
import 'package:rick_and_morty/injections/injections_shared.dart' as _i11;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerSharedModule = _$RegisterSharedModule();
    gh.singleton<_i3.AppConfig>(registerSharedModule.appConfig);
    gh.singleton<_i4.Dio>(registerSharedModule.dio(gh<_i3.AppConfig>()));
    gh.singleton<_i5.Isar>(registerSharedModule.isar());
    gh.factory<_i6.CharacterApiProvider>(
        () => _i6.CharacterApiProvider(gh<_i4.Dio>()));
    gh.factory<_i7.CharacterLocalProvider>(
        () => _i7.CharacterLocalProvider(gh<_i5.Isar>()));
    gh.factory<_i8.ICharacterRepository>(() => _i9.CharacterApiRepository(
          gh<_i3.AppConfig>(),
          gh<_i6.CharacterApiProvider>(),
          gh<_i7.CharacterLocalProvider>(),
        ));
    gh.factory<_i10.CharacterState>(
        () => _i10.CharacterState(gh<_i8.ICharacterRepository>()));
    return this;
  }
}

class _$RegisterSharedModule extends _i11.RegisterSharedModule {}
