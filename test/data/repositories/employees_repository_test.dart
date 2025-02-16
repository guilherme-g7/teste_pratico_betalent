import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:teste_pratico_betalent/data/repositories/employees_repository.dart';
import 'package:teste_pratico_betalent/data/services/employees_service.dart';
import 'package:teste_pratico_betalent/domain/models/employees_model.dart';
import 'package:teste_pratico_betalent/utils/exceptions.dart';
import 'package:teste_pratico_betalent/utils/result.dart';

import 'employees_repository_test.mocks.dart';

@GenerateMocks([EmployeesService])
void main() {
  late EmployeesRepositoryImpl repository;
  late MockEmployeesService mockService;

  setUp(() {
    mockService = MockEmployeesService();
    repository = EmployeesRepositoryImpl(employeesService: mockService);
    provideDummy<Result<List<EmployeesModel>>>(Result.success([]));
  });

  group('EmployeesRepository Tests', () {
    test('should return a list of employees when the service returns success', () async {
      final employees = [
        EmployeesModel(
          id: '1',
          name: 'João',
          job: 'Back-end',
          admissionDate: '2019-12-02T00:00:00.000Z',
          phone: '5551234567890',
          image: 'https://img.favpng.com/25/7/23/computer-icons-user-profile-avatar-image-png-favpng-LFqDyLRhe3PBXM0sx2LufsGFU.jpg',
        ),
      ];

      when(mockService.getEmployess()).thenAnswer((_) async => Result.success(employees));

      final result = await repository.getEmployees();

      expect(result, isA<Success<List<EmployeesModel>>>());
      expect((result as Success<List<EmployeesModel>>).value, employees);
    });

    test('should return NotFoundException when service returns NotFoundException', () async {
      when(mockService.getEmployess()).thenAnswer((_) async => Result.error(NotFoundException('Employees not found')));

      final result = await repository.getEmployees();

      expect(result, isA<Error>());
      expect((result as Error).error, isA<NotFoundException>());
    });

    test('should return ServerException when service returns ServerException', () async {
      when(mockService.getEmployess()).thenAnswer((_) async => Result.error(ServerException('Internal Server Error')));

      final result = await repository.getEmployees();

      expect(result, isA<Error>());
      expect((result as Error).error, isA<ServerException>());
    });

    test('should return UnknownException when service returns UnknownException', () async {
      when(mockService.getEmployess()).thenAnswer((_) async => Result.error(UnknownException('Unknown Error')));

      final result = await repository.getEmployees();

      expect(result, isA<Error>());
      expect((result as Error).error, isA<UnknownException>());
    });
  });
}