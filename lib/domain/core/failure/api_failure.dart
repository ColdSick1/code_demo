import 'package:code_demonstration/domain/core/failure/failure.dart';

class FailureApi extends Failure {
  /// Код ошибки
  final int? statusCode;

  final String? errorCode;

  /// Текст ошибки
  final List<String>? bodyText;

  /// Запрос, на который выбило ошибку
  final String? requestPath;

  /// Параметры, которые были переданы в запросе
  final Map<String, dynamic>? query;

  FailureApi(
    super.message, {
    super.stackTrace,
    this.errorCode,
    this.statusCode,
    this.bodyText,
    this.requestPath,
    this.query,
  });

  @override
  String toString() => super.message;
}
