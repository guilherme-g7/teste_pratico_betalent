import '../../domain/models/employees_model.dart';
import '../../utils/result.dart';
import '../services/employees_service.dart';

abstract class EmployeesRepository{
  Future<Result<List<EmployeesModel>>> getEmployees();
}

class EmployeesRepositoryImpl implements EmployeesRepository{
  EmployeesRepositoryImpl({
    required EmployeesService employeesService
  }) : _service = employeesService;

  final EmployeesService _service;

  @override
  Future<Result<List<EmployeesModel>>> getEmployees() async{
    try{
      final result = await _service.getEmployess();
      switch(result){
        case Success<List<EmployeesModel>>():
          return result;
        case Error<List<EmployeesModel>>():
          return Result.error(result.error);
      }
    } on Exception catch(e){
      return Result.error(e);
    }
  }

}