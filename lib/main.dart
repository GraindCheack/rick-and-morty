import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rick_and_morty/injections/injections_base.dart';
import 'package:rick_and_morty/rick_and_morty.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  GetIt.I.registerSingleton<Directory>(dir);

  configureDependencies();
  runApp(const RickAndMorty());
}
