import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dashboard_backend/providers/sidemenu_provider.dart';

import '../../shared/sidebar.dart';
import '../../shared/widget/navbar.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;

  const DashboardLayout({super.key, required this.child});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SideMenuProvider.menuController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEDF1F2),
      body: Stack(
        children: [
          Row(
            children: [
              //TODO: depende de 70 0px
              if (size.width >= 700) Sidebar(),
              Expanded(
                child: Column(
                  children: [
                    Navbar(),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: widget.child,
                    )),
                  ],
                ),
              ),
            ],
          ),
          if (size.width < 700)
            AnimatedBuilder(
              animation: SideMenuProvider.menuController,
              builder: (context, child) => Stack(
                children: [
                  if (SideMenuProvider.isMenuOpen)
                    AnimatedOpacity(
                      opacity: SideMenuProvider.opacity.value,
                      duration: Duration(milliseconds: 200),
                      child: GestureDetector(
                        onTap: () => SideMenuProvider.closeMenu(),
                        child: Container(
                          width: size.width,
                          height: size.height,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                  Transform.translate(
                    offset: Offset(SideMenuProvider.movement.value, 0),
                    child: Sidebar(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
