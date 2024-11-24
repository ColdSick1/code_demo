import 'package:code_demonstration/domain/core/failure/failure.dart';
import 'package:code_demonstration/domain/core/failure/parsing_failure.dart';
import 'package:code_demonstration/domain/entity/search_product.dart';
import 'package:code_demonstration/domain/repository/search_history_repository.dart';
import 'package:code_demonstration/domain/service/cache/products_history/products_history_cache.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SearchHistoryRepository)
class SearchHistoryRepositoryImpl implements SearchHistoryRepository {
  final CacheProductHistoryManager _cacheManager;
  SearchHistoryRepositoryImpl(this._cacheManager);

  @override
  Future<Either<Failure, List<SearchProduct>>> loadStory() async => _cacheManager.loadProduct();

  @override
  Future<Either<Failure, bool>> saveProduct({required SearchProduct product}) async {
    try {
      final result = await _cacheManager.saveProduct(product);
      return Right(result);
    } catch (err) {
      return Left(FailureParsing(err.toString()));
    }
  }
}
