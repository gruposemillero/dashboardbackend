import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:dashboard_backend/providers/auth/auth_provider.dart';
import 'package:dashboard_backend/ui/views/dashboard/dashboard_view.dart';
import 'package:dashboard_backend/ui/views/Auth/login_view.dart';
import 'package:dashboard_backend/ui/views/Auth/register_view.dart';

class AdminHandlers {
  static Handler login = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return const LoginView();
      } else {
        return const DashBoardView();
      }
    },
  );
  static Handler register = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return const RegisterView();
      } else {
        return const DashBoardView();
      }
    },
  );
}
