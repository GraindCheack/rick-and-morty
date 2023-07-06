import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/injections/injections_base.config.dart';

@InjectableInit()
Future<void> configureDependencies({String? env}) async {
  GetIt.I.init(environment: env);
}
