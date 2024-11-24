part of '../http_client.dart';

Either<Failure, dynamic> _responseHandler<T>(
  Response<dynamic> response, [
  Map<String, dynamic>? query,
]) {
  final data = response.data;
  final statusCode = response.statusCode ?? 0;

  if (statusCode >= 200 && statusCode <= 299) {
    return Right(data);
  }

  try {
    return Left(
      FailureApi(
        (data is Map<String, dynamic>?)
            ? (data?['message'] as String? ?? t.errors.somethingWentWrong)
            : t.errors.somethingWentWrong,
        statusCode: statusCode,
        query: query,
        requestPath: response.requestOptions.path,
        errorCode: data['code'] as String?,
      ),
    );
  } catch (_) {
    return Left(FailureApi(t.errors.somethingWentWrong, query: query));
  }
}

Either<Failure, dynamic> _errorHandler<T>(
  DioException err, [
  Map<String, dynamic>? query,
]) {
  final data = err.response?.data;
  final errorMessage = _handleErrorMessage(data as Map<String, dynamic>?);

  if (err.type == DioExceptionType.unknown || err.type == DioExceptionType.connectionError) {
    return left(
      FailureApi(
        errorMessage ?? t.errors.noConnection,
        query: query,
      ),
    );
  }
  if (err.response != null) {
    return _responseHandler<T>(err.response!, query);
  }

  return left(FailureApi(err.toString(), query: query));
}

String? _handleErrorMessage(Map<String, dynamic>? error) {
  if (error == null) return null;

  final baseErrorMessage = error['message'] as String?;
  try {
    final errors = error['errors'] as Map<String, dynamic>?;
    if (errors != null && errors.isNotEmpty) {
      final errorItems = errors.values.toList();
      final errorItemList = errorItems.first as List<dynamic>;

      return errorItemList.first as String?;
    }
  } catch (_) {
    return baseErrorMessage;
  }

  return baseErrorMessage;
}
