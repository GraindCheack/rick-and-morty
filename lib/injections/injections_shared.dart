import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:rick_and_morty/config/config.dart';
import 'package:rick_and_morty/features/character/domain/models/character_model.dart';

@module
abstract class RegisterSharedModule {
  @singleton
  AppConfig get appConfig => AppConfig();

  @singleton
  Dio dio(AppConfig config) => Dio(BaseOptions(baseUrl: config.baseUrl));

  @singleton
  Isar isar() => Isar.openSync([CharacterSchema], directory: GetIt.I<Directory>().path);
}
