import 'package:code_demonstration/domain/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseHttp {
  /// GET-запрос
  Future<Either<Failure, dynamic>> get({
    required String uri,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? extraHeaders,
  });

  /// POST-запрос
  Future<Either<Failure, dynamic>> post({
    required String uri,
    Map<String, dynamic>? body,
    Map<String, dynamic>? extraHeaders,
  });

  /// PUT-запрос
  Future<Either<Failure, dynamic>> put({
    required String uri,
    Map<String, dynamic>? body,
    Map<String, dynamic>? extraHeaders,
  });

  /// DELETE-запрос
  Future<Either<Failure, dynamic>> delete({
    required String uri,
    Map<String, dynamic>? body,
    Map<String, dynamic>? extraHeaders,
  });
}
