import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey3),
        borderRadius: BorderRadius.circular(Spacing.little08),
      ),
      child: Column(
        children: [
          ListTile(
            tileColor: AppColors.blue2,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Spacing.little08),
                topRight: Radius.circular(Spacing.little08),
              ),
            ),
            contentPadding: const EdgeInsets.only(
                left: Spacing.little08, right: Spacing.regular28),
            title: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(Spacing.little08),
                  child:
                      Text("Foto", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: Spacing.little08),
                const Padding(
                  padding: EdgeInsets.all(Spacing.little08),
                  child:
                      Text("Nome", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            trailing: const Icon(Icons.circle, size: 12),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.viewModel.employees.length,
            itemBuilder: (context, index) {
              final employee = widget.viewModel.employees[index];

              return ExpansionTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(employee.image ?? ''),
                  radius: 18,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(left: Spacing.little08),
                  child: Text(employee.name ?? ''),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(Spacing.little08),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDetailRow("Cargo", employee.job ?? ''),
                        _buildDetailRow(
                            "Data de admissão",
                            DateFormat('dd/MM/yyyy')
                                .format(DateTime.parse(employee.admissionDate!))),
                        _buildDetailRow(
                            "Telefone", _formatPhone(employee.phone ?? '')),
                      ],
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) =>
                const Divider(color: AppColors.grey3),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.little04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  String _formatPhone(String? phone) {
    String areaCode = '';
    if (phone != null && phone.length == 13) {
      areaCode = phone.substring(0, 2); // Store the area code
      phone = phone.substring(2); // Remove the area code
    }
    if (phone != null && (phone.length == 10 || phone.length == 11)) {
      return '+$areaCode ${UtilBrasilFields.obterTelefone(phone)}';
    } else {
      return 'Número inválido';
    }
  }
}
