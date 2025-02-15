sealed class Result<T> {
  const Result();

  const factory Result.success(T value) = Success._;

  const factory Result.error(Exception error) = Error._;

}


final class Success<T> extends Result<T> {
  const Success._(this.value);

  final T value;

  @override
  String toString() => 'Result<$T>.success($value)';
}

final class Error<T> extends Result<T> {
  const Error._(this.error);

  final Exception error;

  @override
  String toString() => '$error';
}