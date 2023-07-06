// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_filters_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CharacterFilters {
  String? get name => throw _privateConstructorUsedError;
  CharacterStatus? get status => throw _privateConstructorUsedError;
  String? get species => throw _privateConstructorUsedError;
  CharacterGender? get gender => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CharacterFiltersCopyWith<CharacterFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterFiltersCopyWith<$Res> {
  factory $CharacterFiltersCopyWith(
          CharacterFilters value, $Res Function(CharacterFilters) then) =
      _$CharacterFiltersCopyWithImpl<$Res, CharacterFilters>;
  @useResult
  $Res call(
      {String? name,
      CharacterStatus? status,
      String? species,
      CharacterGender? gender});
}

/// @nodoc
class _$CharacterFiltersCopyWithImpl<$Res, $Val extends CharacterFilters>
    implements $CharacterFiltersCopyWith<$Res> {
  _$CharacterFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? status = freezed,
    Object? species = freezed,
    Object? gender = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CharacterStatus?,
      species: freezed == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as CharacterGender?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CharacterFiltersCopyWith<$Res>
    implements $CharacterFiltersCopyWith<$Res> {
  factory _$$_CharacterFiltersCopyWith(
          _$_CharacterFilters value, $Res Function(_$_CharacterFilters) then) =
      __$$_CharacterFiltersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      CharacterStatus? status,
      String? species,
      CharacterGender? gender});
}

/// @nodoc
class __$$_CharacterFiltersCopyWithImpl<$Res>
    extends _$CharacterFiltersCopyWithImpl<$Res, _$_CharacterFilters>
    implements _$$_CharacterFiltersCopyWith<$Res> {
  __$$_CharacterFiltersCopyWithImpl(
      _$_CharacterFilters _value, $Res Function(_$_CharacterFilters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? status = freezed,
    Object? species = freezed,
    Object? gender = freezed,
  }) {
    return _then(_$_CharacterFilters(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CharacterStatus?,
      species: freezed == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as CharacterGender?,
    ));
  }
}

/// @nodoc

class _$_CharacterFilters implements _CharacterFilters {
  const _$_CharacterFilters(
      {this.name, this.status, this.species, this.gender});

  @override
  final String? name;
  @override
  final CharacterStatus? status;
  @override
  final String? species;
  @override
  final CharacterGender? gender;

  @override
  String toString() {
    return 'CharacterFilters(name: $name, status: $status, species: $species, gender: $gender)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterFilters &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, status, species, gender);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterFiltersCopyWith<_$_CharacterFilters> get copyWith =>
      __$$_CharacterFiltersCopyWithImpl<_$_CharacterFilters>(this, _$identity);
}

abstract class _CharacterFilters implements CharacterFilters {
  const factory _CharacterFilters(
      {final String? name,
      final CharacterStatus? status,
      final String? species,
      final CharacterGender? gender}) = _$_CharacterFilters;

  @override
  String? get name;
  @override
  CharacterStatus? get status;
  @override
  String? get species;
  @override
  CharacterGender? get gender;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterFiltersCopyWith<_$_CharacterFilters> get copyWith =>
      throw _privateConstructorUsedError;
}
