import 'package:flutter/material.dart';
import 'package:dashboard_backend/providers/sidemenu_provider.dart';
import 'package:dashboard_backend/ui/shared/widget/search_text.dart';

import 'nabvar_avatar.dart';
import 'notification_indicator.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        //TODO: condicion icono hamburguesa
        children: [
          // if (size.width <= 700) ...[
          //   IconButton(onPressed: () {}, icon: Icon(Icons.menu_outlined)),
          //   SizedBox(width: 5),
          // ], // tecnica para poner dos o mas
          if (size.width <= 700)
            IconButton(
                onPressed: () => SideMenuProvider.openMenu(),
                icon: Icon(Icons.menu_outlined)),
          SizedBox(width: 5),
          if (size.width > 380)
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 250),
              child: SeachText(),
            ),
          Spacer(),
          NotificationsIndicator(),
          SizedBox(
            width: 10,
          ),
          NavbarAvatar(),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
      );
}
