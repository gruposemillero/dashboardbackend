import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dashboard_backend/providers/auth/auth_provider.dart';
import 'package:dashboard_backend/ui/cards/white_card.dart';
import 'package:dashboard_backend/ui/labels/custom_labels.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user!;
    return Container(
      child: Center(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Text(
              "Dashboard View",
              style: CustomLabels.h1,
            ),
            SizedBox(
              height: 10,
            ),
            WhiteCard(
              title: user.nombre,
              child: Text(user.correo),
            )
          ],
        ),
      ),
    );
  }
}
