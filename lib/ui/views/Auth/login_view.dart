import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dashboard_backend/providers/auth/login_form_provider.dart';
import 'package:dashboard_backend/router/router.dart';
import 'package:dashboard_backend/ui/buttons/custom_outline_button.dart';
import 'package:dashboard_backend/ui/buttons/link_text.dart';
import 'package:dashboard_backend/ui/inputs/custom_inputs.dart';

import '../../../providers/auth/auth_provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return ChangeNotifierProvider(
      create: (context) => LoginFormProvider(),
      child: Builder(
        builder: (context) {
          final loginFormProvider =
              Provider.of<LoginFormProvider>(context, listen: false);
          return Container(
            color: Colors.black,
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 370),
                child: Form(
                  key: loginFormProvider.formKey,
                  child: Column(
                    children: [
                      //EMAIL
                      TextFormField(
                        onFieldSubmitted: (_) =>
                            onFormSubmit(loginFormProvider, authProvider),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        //validator
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? ''))
                            return 'Email no valido';
                          return null;
                        },
                        onChanged: (value) => loginFormProvider.email = value,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: "Ingrese su correo",
                          label: "Email",
                          icon: Icons.email_outlined,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //PASS
                      TextFormField(
                        onFieldSubmitted: (_) =>
                            onFormSubmit(loginFormProvider, authProvider),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        //validator
                        onChanged: (value) =>
                            loginFormProvider.password = value,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ingrese su contraseña";
                          }
                          if (value.length < 6) {
                            return "La contraseña debe ser de 6 caracteres";
                          }
                          return null;
                        },
                        obscureText: true,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: "*******",
                          label: "Password",
                          icon: Icons.lock_outline_rounded,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomOutlineButton(
                        onPressed: () =>
                            onFormSubmit(loginFormProvider, authProvider),
                        text: 'Ingresar',
                        // color: Colors.red,
                        // isFilled: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      LinkText(
                        text: "Nueva cuenta",
                        onPress: () {
                          Navigator.pushNamed(
                              context, Flurorouter.registerRoute);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void onFormSubmit(
      LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    final isValid = loginFormProvider.validateForm();
    if (isValid)
      authProvider.login(loginFormProvider.email, loginFormProvider.password);
  }
}
