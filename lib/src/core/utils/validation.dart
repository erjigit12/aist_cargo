// utils/validators.dart
import 'package:aist_cargo/src/core/core.dart';
import 'package:intl/intl.dart';

class FormValidators {
  static String? requiredField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста, заполните поле "$fieldName"';
    }
    return null;
  }

  static String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста, выберите город';
    }
    if (!CitiesData.cities.contains(value)) {
      return 'Выберите город из списка';
    }
    return null;
  }

  static String? validatefullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста, введите ФИО';
    }
    return null;
  }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста, выберите дату';
    }
    try {
      final date = DateFormat('yyyy-MM-dd').parse(value);
      if (date.isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
        return 'Дата не может быть в прошлом';
      }
    } catch (e) {
      return 'Некорректный формат даты';
    }
    return null;
  }

  static String? validatePackageSelection(int? index) {
    if (index == null || index == -1) {
      return 'Пожалуйста, выберите тип посылки';
    }
    return null;
  }
}
