import 'package:code_demonstration/domain/core/failure/failure.dart';

/// Неизвестная ошибка
class FailureUnknown extends Failure {
  FailureUnknown(super.message, {super.stackTrace});

  @override
  String toString() => super.message;
}
