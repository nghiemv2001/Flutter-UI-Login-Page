import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForGotPassComponent extends StatefulWidget {
  const ForGotPassComponent({super.key});

  @override
  State<ForGotPassComponent> createState() => _ForGotPassComponentState();
}

class _ForGotPassComponentState extends State<ForGotPassComponent> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: Text('Forgot Password?',
          style: GoogleFonts.getFont('Poppins',
              textStyle: TextStyle(
                  color: !isHover ? const Color(0xFFE4E0E5) : Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 13))),
    );
  }
}
