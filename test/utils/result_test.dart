import 'package:flutter_test/flutter_test.dart';
import 'package:teste_pratico_betalent/utils/result.dart';

void main() {
  group('Result Tests', () {
    test('should create a Success result', () {
      final result = Result.success('Success data');

      expect(result, isA<Success<String>>());
      expect((result as Success<String>).value, 'Success data');
    });

    test('should create an Error result', () {
      final error = Exception('Error occurred');
      final result = Result.error(error);

      expect(result, isA<Error>());
      expect((result as Error).error, error);
    });

    test('should handle Success result correctly', () {
      final result = Result.success('Success data');

      if (result is Success<String>) {
        expect(result.value, 'Success data');
      } else {
        fail('Result should be a Success');
      }
    });

    test('should handle Error result correctly', () {
      final error = Exception('Error occurred');
      final result = Result.error(error);

      if (result is Error<dynamic>) {
        expect(result.error, isA<Exception>());
        expect(result.error.toString(), equals('Exception: Error occurred'));
      } else {
        fail('Result should be an Error');
      }
    });
  });
}