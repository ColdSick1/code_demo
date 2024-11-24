///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsRu = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final TranslationsErrorsRu errors = TranslationsErrorsRu.internal(_root);
	late final TranslationsSearchRu search = TranslationsSearchRu.internal(_root);
}

// Path: errors
class TranslationsErrorsRu {
	TranslationsErrorsRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get noConnection => 'Не удалось выполнить запрос, проверьте ваше интернет соединение';
	String get somethingWentWrong => 'Непредвиденная ошибка';
}

// Path: search
class TranslationsSearchRu {
	TranslationsSearchRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get emptyPage => 'К сожалению ничего не найдено';
	String get tryAgain => 'Попробуйте другой запрос';
	String get catalog => 'Каталог';
	String get popularRequest => 'Популярные запросы';
	String get previosSearch => 'Ранее вы искали';
	String get searchInCatalog => 'Искать в каталоге';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'errors.noConnection': return 'Не удалось выполнить запрос, проверьте ваше интернет соединение';
			case 'errors.somethingWentWrong': return 'Непредвиденная ошибка';
			case 'search.emptyPage': return 'К сожалению ничего не найдено';
			case 'search.tryAgain': return 'Попробуйте другой запрос';
			case 'search.catalog': return 'Каталог';
			case 'search.popularRequest': return 'Популярные запросы';
			case 'search.previosSearch': return 'Ранее вы искали';
			case 'search.searchInCatalog': return 'Искать в каталоге';
			default: return null;
		}
	}
}

