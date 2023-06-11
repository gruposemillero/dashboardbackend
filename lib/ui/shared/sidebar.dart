import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dashboard_backend/providers/auth/auth_provider.dart';
import 'package:dashboard_backend/providers/sidemenu_provider.dart';
import 'package:dashboard_backend/router/router.dart';
import 'package:dashboard_backend/services/navigation_services.dart';
import 'package:dashboard_backend/ui/shared/widget/logo.dart';
import 'package:dashboard_backend/ui/shared/widget/menu_item.dart';
import 'package:dashboard_backend/ui/shared/widget/text_separator.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Logo(),
          SizedBox(
            height: 50,
          ),
          TextSeparator(text: 'main'),
          MenuItem(
            text: 'Dashboard',
            icon: Icons.compass_calibration_outlined,
            isActive:
                sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
            onPressed: () {
              NavigationServices.navigateTo(Flurorouter.dashboardRoute);
            },
          ),
          MenuItem(
            text: 'Orders',
            icon: Icons.shopping_cart_outlined,
            isActive: false,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Analytics',
            icon: Icons.show_chart_outlined,
            isActive: false,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Categories',
            icon: Icons.layers_outlined,
            isActive: sideMenuProvider.currentPage == Flurorouter.categoryRoute,
            onPressed: () =>
                NavigationServices.navigateTo(Flurorouter.categoryRoute),
          ),
          MenuItem(
            text: 'Products',
            icon: Icons.dashboard_outlined,
            isActive: false,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Discount',
            icon: Icons.attach_money_outlined,
            isActive: false,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Customers',
            icon: Icons.people_outline_outlined,
            isActive: false,
            onPressed: () {},
          ),
          SizedBox(
            height: 30,
          ),
          TextSeparator(text: 'UI Elements'),
          MenuItem(
              text: 'Icons',
              icon: Icons.list_alt_outlined,
              isActive: sideMenuProvider.currentPage == Flurorouter.iconRoute,
              onPressed: () {
                NavigationServices.navigateTo(Flurorouter.iconRoute);
              }),
          MenuItem(
            text: 'Marketing',
            icon: Icons.mark_email_read_outlined,
            isActive: false,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Campaign',
            icon: Icons.note_add_outlined,
            isActive: false,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Blank Page',
            icon: Icons.post_add_outlined,
            isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
            onPressed: () =>
                NavigationServices.navigateTo(Flurorouter.blankRoute),
          ),
          SizedBox(
            height: 40,
          ),
          TextSeparator(text: 'Exit'),
          MenuItem(
            text: 'Logout ',
            icon: Icons.exit_to_app_outlined,
            isActive: false,
            onPressed: () =>
                Provider.of<AuthProvider>(context, listen: false).logout(),
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff092044),
              Color(0xff092042),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            )
          ]);
}
