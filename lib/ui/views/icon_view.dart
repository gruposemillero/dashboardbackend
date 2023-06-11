import 'package:flutter/material.dart';
import 'package:dashboard_backend/ui/cards/white_card.dart';
import 'package:dashboard_backend/ui/labels/custom_labels.dart';

class IconView extends StatelessWidget {
  const IconView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Center(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Text(
              "Icons",
              style: CustomLabels.h1,
            ),
            size.width <= 597
                ? _celular()
                : _destokpAndTablet(), // para que no se sobre salga
          ],
        ),
      ),
    );
  }
}

class _destokpAndTablet extends StatelessWidget {
  const _destokpAndTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        direction: Axis.horizontal,
        children: [
          WhiteCard(
            title: 'Ac_unit_outlined',
            width: 170,
            child: Center(child: Icon(Icons.ac_unit_outlined)),
          ),
          WhiteCard(
            title: 'access_time_filled',
            width: 170,
            child: Center(child: Icon(Icons.access_time_filled)),
          ),
          WhiteCard(
            title: 'abc_sharp',
            width: 170,
            child: Center(child: Icon(Icons.abc_sharp)),
          ),
          WhiteCard(
            title: 'add_a_photo_outlined',
            width: 170,
            child: Center(child: Icon(Icons.add_a_photo_outlined)),
          ),
          WhiteCard(
            title: 'deblur_sharp',
            width: 170,
            child: Center(child: Icon(Icons.deblur_sharp)),
          ),
          WhiteCard(
            title: 'celebration',
            width: 170,
            child: Center(child: Icon(Icons.celebration)),
          ),
          WhiteCard(
            title: 'kebab_dining_outlined',
            width: 170,
            child: Center(child: Icon(Icons.kebab_dining_outlined)),
          ),
          WhiteCard(
            title: 'media_bluetooth_off',
            width: 170,
            child: Center(child: Icon(Icons.media_bluetooth_off)),
          ),
        ],
      ),
    );
  }
}

class _celular extends StatelessWidget {
  const _celular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        direction: Axis.horizontal,
        children: [
          WhiteCard(
            title: 'Ac_unit_outlined',
            width: 170,
            child: Center(child: Icon(Icons.ac_unit_outlined)),
          ),
          WhiteCard(
            title: 'access_time_filled',
            width: 170,
            child: Center(child: Icon(Icons.access_time_filled)),
          ),
          WhiteCard(
            title: 'abc_sharp',
            width: 170,
            child: Center(child: Icon(Icons.abc_sharp)),
          ),
          WhiteCard(
            title: 'add_a_photo_outlined',
            width: 170,
            child: Center(child: Icon(Icons.add_a_photo_outlined)),
          ),
          WhiteCard(
            title: 'deblur_sharp',
            width: 170,
            child: Center(child: Icon(Icons.deblur_sharp)),
          ),
          WhiteCard(
            title: 'celebration',
            width: 170,
            child: Center(child: Icon(Icons.celebration)),
          ),
          WhiteCard(
            title: 'kebab_dining_outlined',
            width: 170,
            child: Center(child: Icon(Icons.kebab_dining_outlined)),
          ),
          WhiteCard(
            title: 'media_bluetooth_off',
            width: 170,
            child: Center(child: Icon(Icons.media_bluetooth_off)),
          ),
        ],
      ),
    );
  }
}
