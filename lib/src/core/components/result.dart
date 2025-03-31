/// Обобщенный класс для обработки результатов операций
sealed class Result<T> {
  const Result();
}

/// Успешный результат с данными
class Success<T> extends Result<T> {
  final T data;

  const Success(this.data);
}

/// Ошибка с сообщением
class Failure<T> extends Result<T> {
  final String message;

  const Failure(this.message);
}
