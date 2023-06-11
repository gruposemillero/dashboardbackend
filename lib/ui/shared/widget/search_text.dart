import 'package:flutter/material.dart';
import 'package:dashboard_backend/ui/inputs/custom_inputs.dart';

class SeachText extends StatelessWidget {
  const SeachText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: buildBoxDecoration(),
      child: TextField(
        decoration: CustomInputs.searchInputDecoration(
            hint: "Buscar", icon: Icons.search_outlined),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.1),
      );
}
