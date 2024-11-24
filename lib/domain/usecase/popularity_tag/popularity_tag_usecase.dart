import 'package:code_demonstration/domain/core/failure/failure.dart';
import 'package:code_demonstration/domain/entity/search_tag.dart';
import 'package:code_demonstration/domain/repository/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Получение тегов для поиска
@injectable
class PopularityTagUsecase {
  final SearchRepository _repository;
  PopularityTagUsecase(this._repository);

  Future<Either<Failure, List<SearchTag>>> call() async => _repository.getTags();
}
