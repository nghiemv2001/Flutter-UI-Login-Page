import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: isHover
              ? const LinearGradient(
                  colors: [Color(0xFF7579ff), Color(0xFFb224ef)],
                  begin: Alignment(-0.1, 1),
                  end: Alignment.topCenter,
                )
              : null,
          color: isHover ? null : Colors.white,
        ),
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Colors.transparent, // Transparent to show gradient
              foregroundColor:
                  isHover ? Colors.green : Colors.blue, // Text color
              shadowColor: Colors.transparent, // Remove shadow
              shape: const StadiumBorder(),
              minimumSize: const Size(128, 58),
            ),
            child: Text(
              'Login',
              style: GoogleFonts.getFont(
                'Poppins',
                textStyle: TextStyle(
                  color: isHover ? Colors.white : const Color(0xFF575C75),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            )),
      ),
    );
  }
}
