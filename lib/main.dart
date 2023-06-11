import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:dashboard_backend/providers/auth/auth_provider.dart';
import 'package:dashboard_backend/providers/sidemenu_provider.dart';

import 'package:dashboard_backend/api/CafeApi.dart';

import 'package:dashboard_backend/router/router.dart';

import 'package:dashboard_backend/services/local_storage.dart';
import 'package:dashboard_backend/services/navigation_services.dart';
import 'package:dashboard_backend/services/notification_services.dart';

import 'package:dashboard_backend/ui/layouts/auth/auth_layout.dart';
import 'package:dashboard_backend/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:dashboard_backend/ui/layouts/splash/splash_layout.dart';

void main() async {
  await LocalStorage.configurePrefs();
  CafeApi.configureDio();
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (context) => SideMenuProvider(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: Flurorouter.rootRoute,
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationServices.navigatorKey,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      builder: (context, child) {
        final authProvider = Provider.of<AuthProvider>(context);
        if (authProvider.authStatus == AuthStatus.checking) {
          return SplashLayout();
        }
        if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child ?? Container());
        } else {
          return AuthLayouth(child: child ?? Container());
        }
        //chil es para poenr ese espacio donde ira la vista
      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStatePropertyAll(
            Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
