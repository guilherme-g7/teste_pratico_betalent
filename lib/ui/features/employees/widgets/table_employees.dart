import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../../core/themes/colors.dart';
import '../../../core/themes/spacing.dart';
import '../view_models/employees_viewmodel.dart';

class TableEmployees extends StatefulWidget {
  const TableEmployees({super.key, required this.viewModel});

  final EmployeesViewModel viewModel;

  @override
  State<TableEmployees> createState() => _TableEmployeesState();
}

class _TableEmployeesState extends State<TableEmployees> {
  List<int> _expanded = [];

  @override
  void dispose() {
    super.dispose();
    _expanded.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        return SizedBox(
          width: double.maxFinite,
          child: DataTable(
            border: TableBorder(
              horizontalInside: BorderSide(color: AppColors.grey3),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey3),
              borderRadius: BorderRadius.circular(Spacing.regular16),
            ),
            dividerThickness: 0,
            dataRowMinHeight: Spacing.medium60,
            dataRowMaxHeight: Spacing.medium60,
            headingRowColor: WidgetStateProperty.all(AppColors.blue2),
            columns: [
              DataColumn(
                columnWidth: FixedColumnWidth(Spacing.medium40),
                headingRowAlignment: MainAxisAlignment.start,
                label: Text('Foto',
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              DataColumn(
                headingRowAlignment: MainAxisAlignment.start,
                label: Text('Nome',
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              DataColumn(
                headingRowAlignment: MainAxisAlignment.end,
                label: Icon(
                  Icons.circle,
                  color: AppColors.black1,
                  size: Spacing.little08,
                ),
              ),
            ],
            rows: widget.viewModel.employees.map((employee) {
              int index = widget.viewModel.employees.indexOf(employee);
              return DataRow(
                cells: <DataCell>[
                  DataCell(
                    CircleAvatar(
                      backgroundImage: NetworkImage(employee.image ?? ''),
                      radius: 18,
                    ),
                  ),
                  DataCell(Text(employee.name ?? '')),
                  DataCell(
                    onTap: () {
                      setState(() {
                        if (_expanded.contains(index)) {
                          _expanded.remove(index);
                        } else {
                          _expanded.add(index);
                        }
                      });
                    },
                    Align(
                      alignment: Alignment.centerRight,
                      child: Icon(_expanded.contains(index)
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
