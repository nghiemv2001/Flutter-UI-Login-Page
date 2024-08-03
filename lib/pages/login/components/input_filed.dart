import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final FocusNode focusNode;
  final String placeholder;
  final IconData icon;
  final bool isPassword;
  final AnimationController animationController;
  final AnimationController borderColorAnimationController;
  final Animation<double> borderColorAnimation;
  final Animation<double> iconSizeAnimation;
  final EdgeInsets contentPadding;
  final double borderHeight;

  const CustomTextField({
    super.key,
    required this.focusNode,
    required this.placeholder,
    required this.icon,
    required this.isPassword,
    required this.animationController,
    required this.borderColorAnimationController,
    required this.borderColorAnimation,
    required this.iconSizeAnimation,
    required this.contentPadding,
    required this.borderHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge(
          [animationController, borderColorAnimationController]),
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.zero,
          width: 400,
          height: 65,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(
                width: 2.5,
                color: Colors.transparent,
              ),
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                left: 2,
                top: 24 - animationController.value * 20,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: iconSizeAnimation.value,
                ),
              ),
              ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: const [Colors.white, Color(0xFFA26CF9)],
                    stops: [
                      borderColorAnimation.value,
                      borderColorAnimation.value + 0.00
                    ],
                  ).createShader(rect);
                },
                child: Container(
                  height: borderHeight,
                  width: 400,
                  color: Colors.white,
                ),
              ),
              TextField(
                focusNode: focusNode,
                obscureText: isPassword,
                decoration: InputDecoration(
                  hintText: placeholder,
                  hintStyle: const TextStyle(color: Colors.white),
                  fillColor: Colors.transparent,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: contentPadding,
                ),
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
