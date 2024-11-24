import 'dart:async';
import 'dart:convert';

import 'package:code_demonstration/domain/core/failure/failure.dart';
import 'package:code_demonstration/domain/core/failure/parsing_failure.dart';
import 'package:code_demonstration/domain/service/cache/cache_client.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: CacheClient)
class MobileHiveCacheClient implements CacheClient {
  MobileHiveCacheClient();

  Box<dynamic>? _client;

  @override
  FutureOr<void> init() async {
    await Hive.initFlutter();
    _client = await Hive.openBox('AppBox');
  }

  @override
  FutureOr<bool> writeData(StorageKey key, CacheObject data) async {
    _client ?? await init();

    try {
      await _client?.put(key.storageKey, data.toJson());
      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  FutureOr<Either<Failure, Map<String, dynamic>>> loadData(StorageKey key) async {
    _client ?? await init();

    try {
      final result = _client!.get(key.storageKey);
      if (result == null) return const Right({});

      return Right(jsonDecode(result as String) as Map<String, dynamic>);
    } catch (err, trc) {
      return Left(FailureParsing(err.toString(), stackTrace: trc));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteData(StorageKey key) async {
    _client ?? await init();

    try {
      await _client!.delete(key.storageKey);
      return const Right(true);
    } catch (err) {
      return Left(FailureParsing(err.toString()));
    }
  }

  @override
  FutureOr<bool> containsData(StorageKey key) async {
    _client ?? await init();

    return _client!.containsKey(key.storageKey);
  }
}
