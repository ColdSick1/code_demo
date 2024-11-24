import 'package:code_demonstration/core/service/http/base_http.dart';
import 'package:code_demonstration/domain/core/failure/api_failure.dart';
import 'package:code_demonstration/domain/core/failure/failure.dart';
import 'package:code_demonstration/domain/core/failure/unknown_failure.dart';
import 'package:code_demonstration/gen/translations.g.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

part 'handlers/http_handlers.dart';

@Singleton(as: BaseHttp)
class HttpClient implements BaseHttp {
  final _dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api/'));

  @override
  Future<Either<Failure, dynamic>> get({
    required String uri,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? extraHeaders,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        uri,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Accept": "application/json",
          },
        ),
      );
      return _responseHandler(response, queryParameters);
    } on DioException catch (err) {
      return _errorHandler(err, queryParameters);
    } catch (err, str) {
      return left(FailureUnknown(err.toString(), stackTrace: str));
    }
  }

  @override
  Future<Either<Failure, dynamic>> delete({
    required String uri,
    Map<String, dynamic>? body,
    Map<String, dynamic>? extraHeaders,
  }) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> post({
    required String uri,
    Map<String, dynamic>? body,
    Map<String, dynamic>? extraHeaders,
  }) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> put({
    required String uri,
    Map<String, dynamic>? body,
    Map<String, dynamic>? extraHeaders,
  }) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
