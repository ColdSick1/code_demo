import 'package:code_demonstration/domain/core/failure/failure.dart';
import 'package:code_demonstration/domain/entity/search_product.dart';
import 'package:code_demonstration/domain/entity/search_tag.dart';
import 'package:dartz/dartz.dart';

/// Репозиторий поиска
abstract interface class SearchRepository {
  /// Поиск
  Future<Either<Failure, List<SearchProduct>>> search({
    required String searchRequest,
    String? nextLink,
  });

  /// Получение популярных тегов
  Future<Either<Failure, List<SearchTag>>> getTags();
}
