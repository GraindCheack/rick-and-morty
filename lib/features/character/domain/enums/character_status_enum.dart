enum CharacterStatus {
  alive._('Alive'),
  dead._('Dead'),
  unknown._('Unknown');

  const CharacterStatus._(this.name);
  factory CharacterStatus.fromName(String? name) => CharacterStatus.values.firstWhere(
        (e) => e.name == name,
        orElse: () => CharacterStatus.unknown,
      );

  static List<CharacterStatus> get visualValues =>
      CharacterStatus.values.where((e) => e != CharacterStatus.unknown).toList();

  final String name;

  @override
  String toString() => name;
}
