import 'package:flutter/material.dart';

import '../../../core/themes/colors.dart';

class SearchEmployees extends StatefulWidget {
  const SearchEmployees({super.key});

  @override
  State<SearchEmployees> createState() => _SearchEmployeesState();
}

class _SearchEmployeesState extends State<SearchEmployees> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: "Pesquisar",
        hintStyle: TextStyle(color: AppColors.black1),
        filled: true,
        fillColor: AppColors.grey3,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
