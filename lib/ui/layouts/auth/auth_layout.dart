import 'package:flutter/material.dart';
import 'package:dashboard_backend/ui/layouts/auth/widgets/background_twitter.dart';
import 'package:dashboard_backend/ui/layouts/auth/widgets/custom_title.dart';
import 'package:dashboard_backend/ui/layouts/auth/widgets/links_bar.dart';

class AuthLayouth extends StatelessWidget {
  final Widget child;
  const AuthLayouth({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          (size.width > 1000)
              ? _DesktopBody(child: child)
              : _MobileBody(child: child),
          //linksbar

          LinksBar()
        ],
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;
  const _MobileBody({required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          CustomTitle(),
          Container(
            width: double.infinity,
            height: size.height,
            child: child,
          ),
          Container(
            child: BackgroudTwitter(),
            width: double.infinity,
            height: size.height * 0.4,
          )
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;
  const _DesktopBody({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.95,
      color: Colors.black,
      child: Row(
        children: [
          //fondo
          Expanded(child: BackgroudTwitter()),
          //View Container
          Container(
            width: 550,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomTitle(),
                SizedBox(
                  height: 20,
                ),
                Expanded(child: child),
              ],
            ),
          )
        ],
      ),
    );
  }
}
