import 'package:flutter/material.dart';

class HeaderIcon extends StatelessWidget {
  const HeaderIcon({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: 55),
        Container(
          height: media.height * 0.145,
          width: media.width * 0.155,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.elliptical(450, 220)),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset('assets/images/mevivu_img.png'),
            ),
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          "MEVIVU MANAGER",
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
