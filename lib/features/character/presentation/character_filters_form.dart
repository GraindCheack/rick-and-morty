import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/offset_constants.dart';
import 'package:rick_and_morty/features/character/domain/enums/character_gender_enum.dart';
import 'package:rick_and_morty/features/character/domain/enums/character_status_enum.dart';
import 'package:rick_and_morty/features/character/domain/models/character_filters_model.dart';

class CharacterListFiltersForm extends StatefulWidget {
  const CharacterListFiltersForm({
    super.key,
    required this.initialFilters,
    this.controller,
  });

  final CharacterFiltersFormController? controller;
  final CharacterFilters initialFilters;

  @override
  State<CharacterListFiltersForm> createState() => _CharacterListFiltersFormState();
}

class _CharacterListFiltersFormState extends State<CharacterListFiltersForm> {
  late final CharacterFiltersFormController _controller = widget.controller ?? CharacterFiltersFormController();

  @override
  void initState() {
    _controller.updateFromFilters(widget.initialFilters);
    super.initState();
  }

  void _changeStatus(CharacterStatus? v) => _controller._status = v;
  void _changeGender(CharacterGender? v) => _controller._gender = v;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controller._formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Name'),
            controller: _controller._nameController,
          ),
          const SizedBox(height: OffsetConstants.xs),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Race'),
            controller: _controller._speciesController,
          ),
          const SizedBox(height: OffsetConstants.xs),
          Row(
            children: [
              Flexible(
                child: DropdownButtonFormField(
                  items:
                      CharacterStatus.visualValues.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
                  value: _controller._status,
                  decoration: const InputDecoration(labelText: 'Status'),
                  onChanged: _changeStatus,
                ),
              ),
              const SizedBox(width: OffsetConstants.xs),
              Flexible(
                child: DropdownButtonFormField(
                  items:
                      CharacterGender.visualValues.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
                  value: _controller._gender,
                  decoration: const InputDecoration(labelText: 'Gender'),
                  onChanged: _changeGender,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CharacterFiltersFormController {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _speciesController = TextEditingController();

  CharacterGender? _gender;
  CharacterStatus? _status;

  CharacterFilters get filters => CharacterFilters(
        gender: _gender,
        status: _status,
        name: _nameController.text.isEmpty ? null : _nameController.text,
        species: _speciesController.text == '' ? null : _speciesController.text,
      );

  void reset() {
    _formKey.currentState?.reset();
    _nameController.clear();
    _speciesController.clear();
  }

  void updateFromFilters(CharacterFilters filters) {
    _nameController.text = filters.name ?? '';
    _speciesController.text = filters.species ?? '';
    _gender = filters.gender;
    _status = filters.status;
  }
}
