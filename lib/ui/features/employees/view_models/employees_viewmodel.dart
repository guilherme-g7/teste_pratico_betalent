import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../../../data/repositories/employees_repository.dart';
import '../../../../domain/models/employee_model.dart';
import '../../../../utils/result.dart';

class EmployeesViewModel extends ChangeNotifier {
  EmployeesViewModel({
    required EmployeesRepository repository,
  }) : _repository = repository;

  final EmployeesRepository _repository;
  List<EmployeeModel> _allEmployees = [];
  List<EmployeeModel> _employees = [];
  String? _errorMessage;

  List<EmployeeModel> get employees => _employees;
  set employees(List<EmployeeModel> value) {
    _employees = value;
    notifyListeners();
  }

  String get errorMessage => _errorMessage ?? '';

  set errorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }
  Future<void> fetchEmployees() async {
    final result = await _repository.getEmployees();
    switch (result) {
      case Success<List<EmployeeModel>>():
        _allEmployees = result.value;
        _employees = _allEmployees;
        _errorMessage = null;
        break;
      case Error<List<EmployeeModel>>(error: var error):
        _allEmployees = [];
        _employees = [];
        _errorMessage = error.toString();
        break;
    }
    notifyListeners();
  }

  void searchEmployees(String searchText) {
    if (searchText.isEmpty) {
      _employees = _allEmployees;
      _errorMessage = null;
    } else {
      final filteredEmployees = _allEmployees.where((element) {
        return element.name!.toLowerCase().contains(searchText.toLowerCase());
      }).toList();

      if (filteredEmployees.isEmpty) {
        _errorMessage = 'No employees found';
      } else {
        _errorMessage = null;
      }
      _employees = filteredEmployees;
    }
    notifyListeners();
  }
}