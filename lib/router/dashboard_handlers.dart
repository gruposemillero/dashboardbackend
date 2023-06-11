import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:dashboard_backend/providers/sidemenu_provider.dart';
import 'package:dashboard_backend/router/router.dart';
import 'package:dashboard_backend/ui/views/blank_view.dart';
import 'package:dashboard_backend/ui/views/category_view.dart';
import 'package:dashboard_backend/ui/views/icon_view.dart';

import '../providers/auth/auth_provider.dart';
import '../ui/views/Auth/login_view.dart';
import 'package:dashboard_backend/ui/views/dashboard/dashboard_view.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.dashboardRoute);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const DashBoardView();
      } else {
        return const LoginView();
      }
    },
  );
  static Handler icon = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.iconRoute);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const IconView();
      } else {
        return const LoginView();
      }
    },
  );
  static Handler blank = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.blankRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const BlankView();
      } else {
        return const LoginView();
      }
    },
  );
  static Handler category = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.categoryRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const CategoryView();
      } else {
        return const LoginView();
      }
    },
  );
}
