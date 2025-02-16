
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

import '../../domain/models/employees_model.dart';
import '../../utils/api_client.dart';
import '../../utils/exceptions.dart';
import '../../utils/result.dart';

class EmployeesService extends ApiClient{
  final _log = Logger('EmployeesService');

  EmployeesService({super.host, super.port, super.clientFactory});

  Future<Result<List<EmployeesModel>>> getEmployess() async{
    final client = clientFactory();
    final url = '$baseUrl/employees';

    try{
      Response response = await client.get(url);
      if(response.statusCode == 200){
        List<dynamic> json = response.data;
        final List<EmployeesModel> companies = json.map((e) => EmployeesModel.fromJson(e)).toList();
        return Result.success(companies);
      } else{

        return Result.error(UnknownException('Unknown Error!\n ${response.statusCode} - ${response.data}'));
      }
    } on DioException catch(e){
      _log.severe('Failed get employees, $e');

      if(e.response?.statusCode == 404){
        return Result.error(NotFoundException(e.response?.data.toString() ?? 'Employees not fund'));
      }

      if(e.response?.statusCode == 500) {
        return Result.error(ServerException(e.response?.data.toString() ?? 'Internal Server Error'));
      }

      return Result.error(UnknownException(e.message ?? 'Unknown Error'));
    } finally{
      client.close();
    }
  }
}