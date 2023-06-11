import 'package:flutter/material.dart';
import 'package:dashboard_backend/ui/cards/white_card.dart';
import 'package:dashboard_backend/ui/labels/custom_labels.dart';

class BlankView extends StatelessWidget {
  const BlankView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Text(
              "Blank View",
              style: CustomLabels.h1,
            ),
            SizedBox(
              height: 10,
            ),
            WhiteCard(
              child: Text('Hola mundo'),
              title: 'Sales Statistics',
            )
          ],
        ),
      ),
    );
  }
}
