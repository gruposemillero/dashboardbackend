import 'package:flutter/material.dart';
// import 'package:proyectobackendpedrito/providers/auth_provider.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // final AuthProvider authProvider;
  String email = '';
  String password = '';

  // LoginFormProvider(this.authProvider); // no esta mal pero hay mejor forma

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      // authProvider.login(email, password);
      return true;
    } else {
      return false;
    }
  }
}
