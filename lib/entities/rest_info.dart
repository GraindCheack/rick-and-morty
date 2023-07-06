import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_info.g.dart';

@JsonSerializable()
class RestInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  const RestInfo({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  const RestInfo.empty() : this(count: 0, pages: 0);

  factory RestInfo.fromJson(Map<String, dynamic> json) => _$RestInfoFromJson(json);
  Map<String, dynamic> toJson() => _$RestInfoToJson(this);
}
