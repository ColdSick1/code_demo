import 'package:code_demonstration/domain/core/failure/failure.dart';
import 'package:code_demonstration/domain/entity/search_product.dart';
import 'package:code_demonstration/domain/repository/search_history_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Сохранение продукта в истории поиска
@injectable
class SaveProductUsecase {
  final SearchHistoryRepository _repository;
  SaveProductUsecase(this._repository);

  Future<Either<Failure, bool>> call({required SearchProduct product}) => _repository.saveProduct(
        product: product,
      );
}
