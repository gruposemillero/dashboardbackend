import 'package:fluro/fluro.dart';
import 'package:dashboard_backend/router/admin_handlers.dart';
import 'package:dashboard_backend/router/dashboard_handlers.dart';
import 'package:dashboard_backend/router/error_404_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();
  static String rootRoute = '/';
  //Auth Routes
  static String loginRoute = '/auth/login/';
  static String registerRoute = '/auth/register/';
  // dashboard Route
  static String dashboardRoute = '/dashboard/';
  static String iconRoute = '/dashboard/icons/';
  static String blankRoute = '/dashboard/blank/';
  static String categoryRoute = '/dashboard/category/';

  static void configureRoutes() {
    router.define(rootRoute, handler: AdminHandlers.login);
    router.define(loginRoute, handler: AdminHandlers.login);
    router.define(registerRoute, handler: AdminHandlers.register);

    //Dashboard
    router.define(dashboardRoute, handler: DashboardHandlers.dashboard);
    router.define(iconRoute, handler: DashboardHandlers.icon);
    router.define(blankRoute, handler: DashboardHandlers.blank);
    router.define(categoryRoute, handler: DashboardHandlers.category);

    //404
    router.notFoundHandler = NotPageFoundHandlers.error_404;
  }
  //Auth Routes
}
