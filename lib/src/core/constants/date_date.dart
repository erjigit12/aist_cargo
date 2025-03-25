// widgets/date_autocomplete.dart
import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateAutocomplete extends StatelessWidget {
  final String title;
  final String? initialValue;
  final ValueChanged<String> onSelected;
  final IconData? prefixIcon;

  const DateAutocomplete({
    super.key,
    required this.title,
    this.initialValue,
    required this.onSelected,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.f12w600),
        8.h,
        Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return _generateDefaultDateOptions();
            }
            return _generateDateOptions(textEditingValue.text);
          },
          onSelected: onSelected,
          fieldViewBuilder: (
            BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted,
          ) {
            if (initialValue != null) {
              textEditingController.text = initialValue!;
            }
            return TextField(
              controller: textEditingController,
              focusNode: focusNode,
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Выберите дату',
                prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (picked != null) {
                  final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
                  textEditingController.text = formattedDate;
                  onSelected(formattedDate);
                }
              },
            );
          },
          optionsViewBuilder: (
            BuildContext context,
            AutocompleteOnSelected<String> onSelected,
            Iterable<String> options,
          ) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: 4.0,
                child: SizedBox(
                  height: options.length * 48.0,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      final option = options.elementAt(index);
                      return ListTile(
                        title: Text(option),
                        onTap: () => onSelected(option),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Iterable<String> _generateDefaultDateOptions() {
    final now = DateTime.now();
    return [
      DateFormat('yyyy-MM-dd').format(now),
      DateFormat('yyyy-MM-dd').format(now.add(const Duration(days: 1))),
      DateFormat('yyyy-MM-dd').format(now.add(const Duration(days: 2))),
    ];
  }

  Iterable<String> _generateDateOptions(String input) {
    try {
      final date = DateFormat('yyyy-MM-dd').parse(input);
      return [
        DateFormat('yyyy-MM-dd').format(date),
        DateFormat('yyyy-MM-dd').format(date.add(const Duration(days: 1))),
        DateFormat('yyyy-MM-dd').format(date.add(const Duration(days: 2))),
      ];
    } catch (e) {
      return _generateDefaultDateOptions();
    }
  }
}
