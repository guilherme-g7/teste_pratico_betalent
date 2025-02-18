import 'package:flutter/material.dart';
import 'package:teste_pratico_betalent/ui/core/ui/custom_body.dart';

import '../../core/themes/colors.dart';
import '../../core/themes/spacing.dart';
import '../../core/ui/custom_app_bar.dart';
import 'widgets/search_employees.dart';
import 'widgets/title_employees.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: CustomBody(
        children: [
          const TitleEmployees(),
          const SearchEmployees(),
          DataTable(
            border: TableBorder.symmetric(
              outside: BorderSide(color: AppColors.black1),
            ),
            columns: [
              DataColumn(
                label: Text('Foto',
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              DataColumn(
                label: Expanded(
                  child: Text('Nome',
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
              ),
              DataColumn(
                label: Icon(
                  Icons.circle,
                  color: AppColors.black1,
                  size: Spacing.little08,
                ),
              ),
            ],
            rows: [
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Sarah')),
                  DataCell(Text('19')),
                  DataCell(Text('Student')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Janine')),
                  DataCell(Text('43')),
                  DataCell(Text('Professor')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('William')),
                  DataCell(Text('27')),
                  DataCell(Text('Associate Professor')),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
