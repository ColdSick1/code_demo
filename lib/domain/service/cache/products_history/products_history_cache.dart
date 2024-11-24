import 'package:code_demonstration/domain/core/failure/failure.dart';
import 'package:code_demonstration/domain/entity/search_product.dart';
import 'package:code_demonstration/domain/service/cache/cache_client.dart';
import 'package:dartz/dartz.dart';

abstract class CacheProductHistoryManager {
  final CacheClient cacheClient;

  CacheProductHistoryManager(this.cacheClient);

  Future<bool> saveProduct(SearchProduct product);

  Future<Either<Failure, List<SearchProduct>>> loadProduct();

  Future<Either<Failure, bool>> deleteProduct();
}
