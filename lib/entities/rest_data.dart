import 'package:rick_and_morty/entities/rest_info.dart';

class RestData<T> {
  final RestInfo info;
  final T results;

  const RestData({
    required this.info,
    required this.results,
  });
}
