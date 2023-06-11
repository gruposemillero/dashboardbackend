import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkText extends StatefulWidget {
  final String text;
  final Function? onPress;
  const LinkText({this.onPress, required this.text, super.key});

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onPress != null) {
          widget.onPress!();
        }
      },
      child: MouseRegion(
        onEnter: (event) => setState(() {
          isHover = true;
        }),
        onExit: (event) => setState(() {
          isHover = false;
        }),
        cursor: SystemMouseCursors.click,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            widget.text,
            style: GoogleFonts.montserratAlternates(
              color: Colors.grey[700],
              decoration:
                  isHover ? TextDecoration.underline : TextDecoration.none,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
