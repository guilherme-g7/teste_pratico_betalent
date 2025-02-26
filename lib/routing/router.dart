import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:teste_pratico_betalent/ui/features/employees/view_models/employees_viewmodel.dart';

import '../ui/features/employees/employess_screen.dart';
import 'routes.dart';

GoRouter router() => GoRouter(
      initialLocation: Routes.employees,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
            name: Routes.employees,
            path: Routes.employees,
            builder: (context, state) {
              return EmployeesScreen(
                viewModel: EmployeesViewModel(
                  repository: context.read(),
                ),
              );
            }),
      ],
    );
