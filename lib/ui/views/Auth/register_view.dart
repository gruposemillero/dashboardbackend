import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dashboard_backend/providers/auth/auth_provider.dart';
import 'package:dashboard_backend/providers/auth/register_form_provider.dart';
import 'package:dashboard_backend/router/router.dart';
import 'package:dashboard_backend/ui/buttons/custom_outline_button.dart';
import 'package:dashboard_backend/ui/buttons/link_text.dart';
import 'package:dashboard_backend/ui/inputs/custom_inputs.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerFormProvider =
            Provider.of<RegisterFormProvider>(context, listen: false);
        return Container(
          color: Colors.black,
          margin: EdgeInsets.only(top: 50),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 370),
              child: ListView(
                children: [
                  Form(
                    key: registerFormProvider.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          //validator
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (value) =>
                              registerFormProvider.nombre = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Ingrese su Nombre";
                            }
                            if (value.length < 3) {
                              return "El Nombre debe ser minimo de 3 caracteres";
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: CustomInputs.loginInputDecoration(
                            hint: "Ingrese su nombre",
                            label: "Nombre",
                            icon: Icons.supervised_user_circle_sharp,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (value) =>
                              registerFormProvider.apellido = value,
                          //validator
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Ingrese su Apellido";
                            }
                            if (value.length < 3) {
                              return "El apellido debe ser minimo de 3 caracteres";
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: CustomInputs.loginInputDecoration(
                            hint: "Ingrese su nombre",
                            label: "Apellido",
                            icon: Icons.person,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (value) =>
                              registerFormProvider.telefono = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Ingrese su telefono";
                            }
                            if (!RegExp(r'^\d+$').hasMatch(value)) {
                              return 'El valor debe ser solo números';
                            }

                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          //validator
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: CustomInputs.loginInputDecoration(
                            hint: "Ingrese su nombre",
                            label: "Telfono",
                            icon: Icons.phone,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //EMAIL
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (value) =>
                              registerFormProvider.email = value,
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? ''))
                              return 'Email no valido';
                            return null;
                          },
                          //validator
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (value) =>
                              registerFormProvider.password = value,
                          //validator
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
                          onPressed: () {
                            final valid = registerFormProvider.validateForm();
                            if (!valid) return;
                            //TODO AuthProvider register
                            final authProvider = Provider.of<AuthProvider>(
                                context,
                                listen: false);
                            authProvider.register(
                                registerFormProvider.email,
                                registerFormProvider.password,
                                registerFormProvider.nombre,
                                registerFormProvider.apellido,
                                registerFormProvider.telefono);
                          },

                          text: 'Crear cuenta',
                          // color: Colors.red,
                          // isFilled: true,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        LinkText(
                          text: "Regresar a login",
                          onPress: () {
                            Navigator.pushNamed(
                                context, Flurorouter.loginRoute);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
