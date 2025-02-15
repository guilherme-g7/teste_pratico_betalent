import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:teste_pratico_betalent/data/services/employees_service.dart';
import 'package:teste_pratico_betalent/domain/models/employees_model.dart';

class MockDioClient extends Mock implements Dio {}

void main() {
  late EmployeesService employeesService;
  late MockDioClient mockDio;

  setUp(() {
    mockDio = MockDioClient();
    employeesService = EmployeesService();
  });

  group('EmployeesService Tests', () {
    test('Should return employees list on success', () async {
      // Organizando: mockando a resposta do Dio para simular um sucesso
      final response = {
        "companies": [
          {"id": 1, "name": "John Doe", "position": "Software Engineer"}
        ]
      };

      when(mockDio.get(any))
          .thenAnswer((_) async => Response(
        data: response,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ));

      final result = await employeesService.getEmployess();

      // Verificando que a resposta foi bem-sucedida
      expect(result.isSuccess, true);
      expect(result.value, isA<List<EmployeesModel>>());
      expect(result.value!.length, 1);
      expect(result.value![0].name, "John Doe");
    });

    test('Should return error for 404 Not Found', () async {
      // Organizando: mockando a resposta do Dio para simular um erro 404
      when(mockDio.get(any))
          .thenAnswer((_) async => Response(
        data: "Employees not found",
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ));

      final result = await employeesService.getEmployess();

      // Verificando que a resposta contém erro
      expect(result.isError, true);
      expect(result.error, isA<NotFoundException>());
    });

    test('Should return error for 500 Internal Server Error', () async {
      // Organizando: mockando a resposta do Dio para simular um erro 500
      when(mockDio.get(any))
          .thenAnswer((_) async => Response(
        data: "Internal Server Error",
        statusCode: 500,
        requestOptions: RequestOptions(path: ''),
      ));

      final result = await employeesService.getEmployess();

      // Verificando que a resposta contém erro
      expect(result.isError, true);
      expect(result.error, isA<ServerException>());
    });

    test('Should return error for unknown exception', () async {
      // Organizando: mockando uma exceção desconhecida
      when(mockDio.get(any)).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Unknown error',
      ));

      final result = await employeesService.getEmployess();

      // Verificando que a resposta contém erro
      expect(result.isError, true);
      expect(result.error, isA<UnknownException>());
    });
  });
}
