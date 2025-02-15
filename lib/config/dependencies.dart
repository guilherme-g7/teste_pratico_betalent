import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:teste_pratico_betalent/data/repositories/employees_repository.dart';

import '../data/services/employees_service.dart';

List<SingleChildWidget> get providers {
  return [
    Provider(create: (context) => Dio()),
    Provider(create: (context) => EmployeesService()),
    Provider(
      create: (context) => EmployeesRepositoryImpl(
        employeesService: context.read(),
      ) as EmployeesRepository,
    ),
  ];
}
