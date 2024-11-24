import 'package:code_demonstration/domain/core/failure/failure.dart';
import 'package:code_demonstration/domain/entity/search_product.dart';
import 'package:dartz/dartz.dart';

/// Репозиторий для работы с историей поиска пользователя
abstract interface class SearchHistoryRepository {
  /// Получить историю поиска
  Future<Either<Failure, List<SearchProduct>>> loadStory();

  /// Сохранить продукт в "Вы недавно искали"
  Future<Either<Failure, bool>> saveProduct({required SearchProduct product});
}
