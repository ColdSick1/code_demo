import 'package:code_demonstration/domain/core/failure/failure.dart';

/// Ошибка, связанная с парсингом данных
class FailureParsing extends Failure {
  FailureParsing(super.message, {super.stackTrace});

  @override
  String toString() => super.message;
}
