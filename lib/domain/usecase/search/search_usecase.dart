import 'package:code_demonstration/domain/core/failure/failure.dart';
import 'package:code_demonstration/domain/entity/search_product.dart';
import 'package:code_demonstration/domain/repository/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Поиск продукта
@injectable
class SearchUsecase {
  final SearchRepository _repository;
  SearchUsecase(this._repository);

  Future<Either<Failure, List<SearchProduct>>> call({
    required String searchRequest,
  }) =>
      _repository.search(searchRequest: searchRequest);
}
