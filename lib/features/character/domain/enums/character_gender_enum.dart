enum CharacterGender {
  female._('Female'),
  male._('Male'),
  genderless._('Genderless'),
  unknown._('Unknown');

  const CharacterGender._(this.name);
  factory CharacterGender.fromName(String? name) => CharacterGender.values.firstWhere(
        (e) => e.name.toLowerCase() == name?.toLowerCase(),
        orElse: () => CharacterGender.unknown,
      );

  static List<CharacterGender> get visualValues =>
      CharacterGender.values.where((e) => e != CharacterGender.unknown).toList();

  final String name;

  @override
  String toString() => name;
}
