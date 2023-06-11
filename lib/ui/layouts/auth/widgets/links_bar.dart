import 'package:flutter/material.dart';
import 'package:dashboard_backend/ui/buttons/link_text.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 20),
      color: Colors.black,
      height: (size.width > 1000) ? size.height * 0.05 : null,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText(
            text: 'About',
            onPress: () => print('hola'),
          ),
          LinkText(text: 'Help Center'),
          LinkText(text: 'Terms of services'),
          LinkText(text: 'Privacy policy'),
          LinkText(text: 'Cookies polocy'),
          LinkText(text: 'Ads info'),
          LinkText(text: 'Blog'),
          LinkText(text: 'Marketing'),
          LinkText(text: 'About'),
        ],
      ),
    );
  }
}
