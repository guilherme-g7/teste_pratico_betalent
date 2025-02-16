import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:logging/logging.dart';
import 'package:teste_pratico_betalent/data/services/employees_service.dart';
import 'package:teste_pratico_betalent/domain/models/employees_model.dart';
import 'package:teste_pratico_betalent/utils/exceptions.dart';
import 'package:teste_pratico_betalent/utils/result.dart';

import 'employees_service_test.mocks.dart';


@GenerateMocks([Dio])
void main() {
  late EmployeesService employeesService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    employeesService = EmployeesService(clientFactory: () => mockDio);
  });

  group('EmployeesService Tests', () {
    test('should return a list of employees when the request is successful', () async {
      final responsePayload =
        [
          {
            "id": "1",
            "name": "João",
            "job": "Back-end",
            "admission_date": "2019-12-02T00:00:00.000Z",
            "phone": "5551234567890",
            "image": "https://img.favpng.com/25/7/23/computer-icons-user-profile-avatar-image-png-favpng-LFqDyLRhe3PBXM0sx2LufsGFU.jpg"
          }
        ];


      when(mockDio.get(any)).thenAnswer((_) async => Response(
        data: responsePayload,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ));

      final result = await employeesService.getEmployess();

      expect(result, isA<Success<List<EmployeesModel>>>());
      expect((result as Success<List<EmployeesModel>>).value.length, 1);
      expect(result.value.first.name, "João");
    });

    test('should return NotFoundException when API returns 404', () async {
      when(mockDio.get(any)).thenThrow(DioException(
        response: Response(
          statusCode: 404,
          requestOptions: RequestOptions(path: ''),
          data: 'Employees not found',
        ),
        requestOptions: RequestOptions(path: ''),
      ));

      final result = await employeesService.getEmployess();

      expect(result, isA<Error>());
      expect((result as Error).error, isA<NotFoundException>());
    });

    test('should return ServerException when API returns 500', () async {
      when(mockDio.get(any)).thenThrow(DioException(
        response: Response(
          statusCode: 500,
          requestOptions: RequestOptions(path: ''),
          data: 'Internal Server Error',
        ),
        requestOptions: RequestOptions(path: ''),
      ));

      final result = await employeesService.getEmployess();

      expect(result, isA<Error>());
      expect((result as Error).error, isA<ServerException>());
    });
  });
}
