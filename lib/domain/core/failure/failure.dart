/// Ошибки в работе приложения
abstract class Failure {
  /// Текст ошибки
  final String message;

  /// Стактрейс для отслеживания
  final StackTrace? stackTrace;

  Failure(
    this.message, {
    this.stackTrace,
  });

  @override
  String toString() => message;
}
