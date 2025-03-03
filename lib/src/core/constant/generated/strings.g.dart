/// Generated file. Do not edit.
///
/// Original: lib/src/core/constants/localization
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 24 (12 per locale)
///
/// Built on 2025-02-15 at 04:54 UTC

// coverage:ignore-file
// ignore_for_file: type=lint, unused_element_parameter

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
  en(languageCode: 'en', build: Translations.build),
  ru(languageCode: 'ru', build: _StringsRu.build);

  const AppLocale(
      {required this.languageCode,
      this.scriptCode,
      this.countryCode,
      required this.build}); // ignore: unused_element

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;
  @override
  final TranslationBuilder<AppLocale, Translations> build;

  /// Gets current instance managed by [LocaleSettings].
  Translations get translations =>
      LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider
    extends BaseTranslationProvider<AppLocale, Translations> {
  TranslationProvider({required super.child})
      : super(settings: LocaleSettings.instance);

  static InheritedLocaleData<AppLocale, Translations> of(
          BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
  Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings
    extends BaseFlutterLocaleSettings<AppLocale, Translations> {
  LocaleSettings._() : super(utils: AppLocaleUtils.instance);

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static AppLocale setLocale(AppLocale locale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale setLocaleRaw(String rawLocale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleRaw(rawLocale,
          listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale useDeviceLocale() => instance.useDeviceLocale();
  @Deprecated('Use [AppLocaleUtils.supportedLocales]')
  static List<Locale> get supportedLocales => instance.supportedLocales;
  @Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]')
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
  static void setPluralResolver(
          {String? language,
          AppLocale? locale,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.setPluralResolver(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
  AppLocaleUtils._()
      : super(baseLocale: _baseLocale, locales: AppLocale.values);

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts(
          {required String languageCode,
          String? scriptCode,
          String? countryCode}) =>
      instance.parseLocaleParts(
          languageCode: languageCode,
          scriptCode: scriptCode,
          countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.en,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  // Translations
  late final _StringsAuthEn auth = _StringsAuthEn._(_root);
}

// Path: auth
class _StringsAuthEn {
  _StringsAuthEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get confirm => 'Confirm';
  String get alreadyHaveAccount => 'Already have an account';
  String get phoneNumber => 'Phone number';
  String get noAccount => 'No account';
  String get login => 'Login to account';
  String get enterTheCode => 'Enter the code from SMS';
  String get sendSmsCode => 'We have sent a message with a code to your number';
  String get messageDoesntArrive => 'The message doesn\'t arrive?';
  String get sendAnotherOneIn => 'Send another one in';
  String get sendOneMore => 'Send one more';
  String get numberNotRegistered => 'Number not registered';
  String get invalidPassword => 'Invalid password';
}

// Path: <root>
class _StringsRu extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _StringsRu.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.ru,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ),
        super.build(
            cardinalResolver: cardinalResolver,
            ordinalResolver: ordinalResolver) {
    super.$meta.setFlatMapFunction(
        $meta.getTranslation); // copy base translations to super.$meta
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <ru>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  @override
  late final _StringsRu _root = this; // ignore: unused_field

  // Translations
  @override
  late final _StringsAuthRu auth = _StringsAuthRu._(_root);
}

// Path: auth
class _StringsAuthRu extends _StringsAuthEn {
  _StringsAuthRu._(_StringsRu root)
      : this._root = root,
        super._(root);

  @override
  final _StringsRu _root; // ignore: unused_field

  // Translations
  @override
  String get confirm => 'Подтвердить';
  @override
  String get alreadyHaveAccount => 'Уже есть аккаунт';
  @override
  String get phoneNumber => 'Номер телефона';
  @override
  String get noAccount => 'Нет аккаунта';
  @override
  String get login => 'Войти в аккаунт';
  @override
  String get enterTheCode => 'Введите код из смс';
  @override
  String get sendSmsCode => 'Мы отправили сообщение с кодом вам на номер';
  @override
  String get messageDoesntArrive => 'Сообщение не приходит?';
  @override
  String get sendAnotherOneIn => 'Отправить еще одно через';
  @override
  String get sendOneMore => 'Отправить еще одно';
  @override
  String get numberNotRegistered => 'Номер не зарегистрирован';
  @override
  String get invalidPassword => 'Неверный пароль';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'auth.confirm':
        return 'Confirm';
      case 'auth.alreadyHaveAccount':
        return 'Already have an account';
      case 'auth.phoneNumber':
        return 'Phone number';
      case 'auth.noAccount':
        return 'No account';
      case 'auth.login':
        return 'Login to account';
      case 'auth.enterTheCode':
        return 'Enter the code from SMS';
      case 'auth.sendSmsCode':
        return 'We have sent a message with a code to your number';
      case 'auth.messageDoesntArrive':
        return 'The message doesn\'t arrive?';
      case 'auth.sendAnotherOneIn':
        return 'Send another one in';
      case 'auth.sendOneMore':
        return 'Send one more';
      case 'auth.numberNotRegistered':
        return 'Number not registered';
      case 'auth.invalidPassword':
        return 'Invalid password';
      default:
        return null;
    }
  }
}

extension on _StringsRu {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'auth.confirm':
        return 'Подтвердить';
      case 'auth.alreadyHaveAccount':
        return 'Уже есть аккаунт';
      case 'auth.phoneNumber':
        return 'Номер телефона';
      case 'auth.noAccount':
        return 'Нет аккаунта';
      case 'auth.login':
        return 'Войти в аккаунт';
      case 'auth.enterTheCode':
        return 'Введите код из смс';
      case 'auth.sendSmsCode':
        return 'Мы отправили сообщение с кодом вам на номер';
      case 'auth.messageDoesntArrive':
        return 'Сообщение не приходит?';
      case 'auth.sendAnotherOneIn':
        return 'Отправить еще одно через';
      case 'auth.sendOneMore':
        return 'Отправить еще одно';
      case 'auth.numberNotRegistered':
        return 'Номер не зарегистрирован';
      case 'auth.invalidPassword':
        return 'Неверный пароль';
      default:
        return null;
    }
  }
}
