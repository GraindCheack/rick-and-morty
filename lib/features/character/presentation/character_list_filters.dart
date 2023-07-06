import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/offset_constants.dart';
import 'package:rick_and_morty/features/character/domain/models/character_filters_model.dart';
import 'package:rick_and_morty/features/character/presentation/character_filters_form.dart';

class CharacterListFilters extends StatefulWidget {
  const CharacterListFilters({super.key, required this.filters, this.onFiltersChanged});

  final CharacterFilters filters;
  final void Function(CharacterFilters filters)? onFiltersChanged;

  @override
  State<CharacterListFilters> createState() => _CharacterListFiltersState();
}

class _CharacterListFiltersState extends State<CharacterListFilters> {
  final ValueNotifier<_FiltersMode> _mode = ValueNotifier(_FiltersMode.collapsed);
  final CharacterFiltersFormController _controller = CharacterFiltersFormController();

  void _toggleMode() {
    _mode.value = _mode.value == _FiltersMode.collapsed ? _FiltersMode.expanded : _FiltersMode.collapsed;
  }

  void _handleApply() {
    _mode.value = _FiltersMode.collapsed;
    widget.onFiltersChanged?.call(_controller.filters);
  }

  void _handleReset() {
    _controller.reset();
    widget.onFiltersChanged?.call(const CharacterFilters());
  }

  @override
  Widget build(BuildContext context) {
    ChipThemeData getChipThemeByColor(Color color) => ChipThemeData.fromDefaults(
          primaryColor: color,
          secondaryColor: Theme.of(context).colorScheme.secondary,
          labelStyle: Theme.of(context).chipTheme.labelStyle ?? const TextStyle(),
        );

    final filterChipTheme = getChipThemeByColor(Theme.of(context).primaryColor);
    final applyChipTheme = getChipThemeByColor(Theme.of(context).primaryColor);
    final resetChipTheme = getChipThemeByColor(Colors.red);

    return Wrap(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RawChip(
              onPressed: _toggleMode,
              label: Row(
                children: [
                  const Text('􀌆', style: TextStyle(fontFamily: 'SF Pro')),
                  const SizedBox(width: OffsetConstants.xs),
                  ValueListenableBuilder(
                    valueListenable: _mode,
                    builder: (context, mode, child) {
                      return Text(
                        mode == _FiltersMode.expanded ? '􀆇' : '􀆈',
                        style: const TextStyle(fontFamily: 'SF Pro'),
                      );
                    },
                  ),
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _mode,
              child: Padding(
                padding: const EdgeInsets.only(left: OffsetConstants.xs),
                child: RawChip(
                  onPressed: _handleApply,
                  defaultProperties: applyChipTheme,
                  label: const Row(
                    children: [
                      Text('􀁢', style: TextStyle(fontFamily: 'SF Pro')),
                      SizedBox(width: OffsetConstants.xs),
                      Text('Apply'),
                    ],
                  ),
                ),
              ),
              builder: (context, mode, child) {
                return Visibility(visible: _mode.value == _FiltersMode.expanded, child: child ?? const SizedBox());
              },
            ),
            const SizedBox(width: OffsetConstants.xs),
            Visibility(
              visible: widget.filters != const CharacterFilters(),
              child: RawChip(
                onPressed: _handleReset,
                defaultProperties: resetChipTheme,
                label: const Row(
                  children: [
                    Text('􁝀', style: TextStyle(fontFamily: 'SF Pro')),
                    SizedBox(width: OffsetConstants.xs),
                    Text('Reset'),
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: OffsetConstants.m),
        ValueListenableBuilder(
          valueListenable: _mode,
          child: CharacterListFiltersForm(
            initialFilters: widget.filters,
            controller: _controller,
          ),
          builder: (context, mode, child) {
            return Visibility(visible: mode == _FiltersMode.expanded, child: child ?? const SizedBox());
          },
        ),
        const SizedBox(width: OffsetConstants.xs),
        ValueListenableBuilder(
          valueListenable: _mode,
          child: Wrap(
            spacing: OffsetConstants.xs,
            children: [
              if (widget.filters.name != null)
                RawChip(defaultProperties: filterChipTheme, label: Text('Name: ${widget.filters.name}')),
              if (widget.filters.species != null)
                RawChip(defaultProperties: filterChipTheme, label: Text('Race: ${widget.filters.species}')),
              if (widget.filters.gender != null)
                RawChip(defaultProperties: filterChipTheme, label: Text('Gender: ${widget.filters.gender?.name}')),
              if (widget.filters.status != null)
                RawChip(defaultProperties: filterChipTheme, label: Text('Status: ${widget.filters.status?.name}')),
            ],
          ),
          builder: (context, mode, child) {
            return Visibility(visible: mode == _FiltersMode.collapsed, child: child ?? const SizedBox());
          },
        )
      ],
    );
  }
}

enum _FiltersMode { collapsed, expanded }
