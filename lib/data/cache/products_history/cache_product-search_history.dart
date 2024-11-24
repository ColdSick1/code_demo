import 'dart:convert';

import 'package:code_demonstration/data/dto/search_result_dto/search_result_dto.dart';
import 'package:code_demonstration/domain/core/failure/failure.dart';
import 'package:code_demonstration/domain/entity/search_product.dart';
import 'package:code_demonstration/domain/service/cache/cache_client.dart';
import 'package:code_demonstration/domain/service/cache/products_history/products_history_cache.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

class _ProductHistoryCache implements CacheObject {
  final List<SearchProduct> cacheList;
  _ProductHistoryCache({required this.cacheList});

  List<Map<String, dynamic>> createCacheObject(List<SearchProduct> productList) => productList
      .map(
        (e) => SearchResultDto(
          id: e.id,
          image: e.image,
          name: e.name,
        ).toJson(),
      )
      .toList();

  @override
  String toJson() => jsonEncode({"data": createCacheObject(cacheList)});
}

@Injectable(as: CacheProductHistoryManager)
class CacheProductHistoryManagerImpl extends CacheProductHistoryManager {
  CacheProductHistoryManagerImpl(super.cacheClient);

  @override
  Future<Either<Failure, bool>> deleteProduct() async =>
      await cacheClient.deleteData(StorageKey.productsHistory);

  @override
  Future<Either<Failure, List<SearchProduct>>> loadProduct() async {
    final data = await cacheClient.loadData(StorageKey.productsHistory);

    return data.fold(
      Left.new,
      (r) {
        if (r.isEmpty) return const Right([]);

        final result = r['data'] as List;
        return Right(SearchResultDto.fromList(result));
      },
    );
  }

  @override
  Future<bool> saveProduct(SearchProduct product) async {
    final result = await loadProduct();

    return await result.fold((_) => false, (productList) async {
      if (productList.isEmpty) {
        final newList = <SearchProduct>[];
        newList.add(product);
        return await cacheClient.writeData(
          StorageKey.productsHistory,
          _ProductHistoryCache(cacheList: newList),
        );
      }

      final index = productList.indexWhere((element) => element.id == product.id);

      if (index != -1) {
        productList.removeAt(index);
        productList.insert(0, product);
        return await cacheClient.writeData(
          StorageKey.productsHistory,
          _ProductHistoryCache(cacheList: productList),
        );
      }

      if (productList.length == 20) {
        productList.removeAt(19);
        productList.insert(0, product);
        return await cacheClient.writeData(
          StorageKey.productsHistory,
          _ProductHistoryCache(cacheList: productList),
        );
      } else {
        productList.insert(0, product);
        return await cacheClient.writeData(
          StorageKey.productsHistory,
          _ProductHistoryCache(cacheList: productList),
        );
      }
    });
  }
}
