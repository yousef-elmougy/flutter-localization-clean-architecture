import '../../domain/entities/locale_entities.dart';

class LocaleModel extends Language {
  const LocaleModel(super.id, super.flag, super.name, super.languageCode);

  static List<Language> languages = const [
    Language(1, "🇦🇫", "فارسی", "fa"),
    Language(2, "🇺🇸", "English", "en"),
    Language(3, "🇸🇦", "اَلْعَرَبِيَّةُ", "ar"),
    Language(4, "🇮🇳", "हिंदी", "hi"),
    Language(5, "🇮🇳", "Deutsch", "de"),
    Language(6, "🇮🇳", "spanish", "es")
  ];
}
