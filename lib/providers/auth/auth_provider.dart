import 'package:flutter/cupertino.dart';
import 'package:dashboard_backend/api/CafeApi.dart';
import 'package:dashboard_backend/model/http/auth_response.dart';
import 'package:dashboard_backend/router/router.dart';
import 'package:dashboard_backend/services/local_storage.dart';
import 'package:dashboard_backend/services/navigation_services.dart';
import 'package:dashboard_backend/services/notification_services.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    isAuthenticated();
  }
  login(String email, String password) {
    final data = {
      'correo': email,
      'password': password,
    };
    CafeApi.httpPost("/auth/login", data).then((json) {
      final autResponse = AuthResponse.fromMap(json);
      user = autResponse.usuario;
      LocalStorage.prefs.setString('token', autResponse.token);
      authStatus = AuthStatus.authenticated;
      CafeApi.configureDio();
      notifyListeners();
      NavigationServices.replaceTo(Flurorouter.dashboardRoute);
    }).catchError((e) {
      print("error en: $e");
      NotificationsService.showSnackbarError(
          "El email o contraseña esta erronea");
    });
  }

  register(String email, String password, String nombre, String apellido,
      String telefono) {
    final data = {
      'nombre': nombre,
      'correo': email,
      'password': password,
      'apellido': apellido,
      'telefono': telefono,
    };
    CafeApi.httpPost("/usuarios", data).then((json) {
      print(json);
      final autResponse = AuthResponse.fromMap(json);
      user = autResponse.usuario;
      LocalStorage.prefs.setString('token', autResponse.token);
      // LocalStorage.prefs.getString('token');
      authStatus = AuthStatus.authenticated;
      CafeApi.configureDio();
      notifyListeners();
      NavigationServices.replaceTo(Flurorouter.dashboardRoute);
    }).catchError((e) {
      print("error en: $e");
      NotificationsService.showSnackbarError(
          "El email introducido ya esta registrado");
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString("token");

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    //TODO ir al backend y comprar si el JWT es valido
    try {
      final resp = await CafeApi.httpGet("/auth");
      final autResponse = AuthResponse.fromMap(resp);
      user = autResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
