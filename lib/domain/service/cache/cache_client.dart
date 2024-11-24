import 'dart:async';

import 'package:code_demonstration/domain/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

/// Ключи доступа к локальному хранилищу
enum StorageKey {
  /// Ключ для объектов истории просмотренных товаров
  productsHistory('productHistory');

  final String storageKey;
  const StorageKey(this.storageKey);
}

/// Клиент для кэширования данных
abstract class CacheClient {
  /// Инициализация
  FutureOr<void> init();

  /// Записать данные
  FutureOr<bool> writeData(StorageKey key, CacheObject data);

  /// Загрузить данные
  FutureOr<Either<Failure, Map<String, dynamic>>> loadData(StorageKey key);

  /// Удалить данные
  FutureOr<Either<Failure, bool>> deleteData(StorageKey key);

  /// Содержится ли ключ в хранилище
  FutureOr<bool> containsData(StorageKey key);
}

/// Объект, который необходимо закэшировать
abstract class CacheObject {
  /// Декодер объекта
  String toJson();
}
