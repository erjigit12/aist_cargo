import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class CitiesData {
  static const List<String> cities = [
    'Москва',
    'Ош',
    'Бишкек',
    'Алматы',
    'Санкт-Петербург',
    'Новосибирск',
    'Екатеринбург',
    'Казань',
    'Нижний Новгород',
    'Новокузнецк',
    'Новый Уренгой',
    'Челябинск',
    'Красноярск',
    'Пермь',
    'Самара',
    'Уфа',
    'Краснодар',
    'Ростов-на-Дону',
    'Томск',
    'Владивосток',
    'Волгоград',
    'Саратов',
  ];

  static List<String> filterCities(List<String> cities, String query) {
    return query.isEmpty
        ? []
        : cities
            .where((city) => city.toLowerCase().contains(query.toLowerCase()))
            .toList();
  }
}

class CityAutocomplete extends StatelessWidget {
  final String title;
  final String? initialValue;
  final ValueChanged<String> onSelected;
  final String? errorText;

  const CityAutocomplete({
    super.key,
    required this.title,
    this.initialValue,
    required this.onSelected,
    this.errorText,
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
              return const Iterable<String>.empty();
            }
            return CitiesData.cities.where((String option) {
              return option
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selection) {
            onSelected(selection);
          },
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
              decoration: InputDecoration(
                hintText: 'Введите город',
                errorText: errorText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
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
                  height: 200,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      final String option = options.elementAt(index);
                      return ListTile(
                        title: Text(option),
                        onTap: () {
                          onSelected(option);
                        },
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
}
