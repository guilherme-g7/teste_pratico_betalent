import 'package:flutter/material.dart';
import 'package:teste_pratico_betalent/ui/core/ui/custom_body.dart';
import 'package:teste_pratico_betalent/ui/features/employees/view_models/employees_viewmodel.dart';

import '../../core/themes/colors.dart';
import '../../core/themes/spacing.dart';
import '../../core/ui/custom_app_bar.dart';
import 'widgets/search_employees.dart';
import 'widgets/table_employees.dart';
import 'widgets/title_employees.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key, required this.viewModel});
  final EmployeesViewModel viewModel;

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {

  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(_listener);
    widget.viewModel.fetchEmployees();
  }

  @override
  void didUpdateWidget(covariant EmployeesScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.removeListener(_listener);
    widget.viewModel.addListener(_listener);
  }

  @override
  void dispose() {
    super.dispose();
    widget.viewModel.removeListener(_listener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: CustomBody(
          children: [
            TitleEmployees(),
            SearchEmployees(viewModel: widget.viewModel),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey3),
                borderRadius: BorderRadius.circular(Spacing.little08),
              ),
              child: TableEmployees(viewModel: widget.viewModel),
            ),
          ],
        ),
      ),
    );
  }

  _listener() {
    setState(() {});
  }
}
