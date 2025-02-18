import '../../domain/models/employee_model.dart';
import '../../utils/result.dart';
import '../services/employees_service.dart';

abstract class EmployeesRepository{
  Future<Result<List<EmployeeModel>>> getEmployees();
}

class EmployeesRepositoryImpl implements EmployeesRepository{
  EmployeesRepositoryImpl({
    required EmployeesService employeesService
  }) : _service = employeesService;

  final EmployeesService _service;

  @override
  Future<Result<List<EmployeeModel>>> getEmployees() async{
    try{
      final result = await _service.getEmployess();
      switch(result){
        case Success<List<EmployeeModel>>():
          return result;
        case Error<List<EmployeeModel>>():
          return Result.error(result.error);
      }
    } on Exception catch(e){
      return Result.error(e);
    }
  }
}