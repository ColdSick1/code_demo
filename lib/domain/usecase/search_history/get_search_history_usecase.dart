import 'package:code_demonstration/domain/core/failure/failure.dart';
import 'package:code_demonstration/domain/entity/search_product.dart';
import 'package:code_demonstration/domain/repository/search_history_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Получение истории поиска
@injectable
class GetSearchHistoryUsecase {
  final SearchHistoryRepository _repository;
  GetSearchHistoryUsecase(this._repository);

  Future<Either<Failure, List<SearchProduct>>> call() => _repository.loadStory();
}
