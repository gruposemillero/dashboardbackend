import 'package:flutter/material.dart';

class NotificationsIndicator extends StatelessWidget {
  const NotificationsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Icon(
            Icons.notifications_none_outlined,
            color: Colors.grey,
          ),
          Positioned(
            left: 3,
            child: Container(
              width: 5,
              height: 5,
              decoration: buildDecoration(),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration buildDecoration() => BoxDecoration(
      color: Colors.red, borderRadius: BorderRadius.circular(100));
}
