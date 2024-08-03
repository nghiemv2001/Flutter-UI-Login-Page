import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    super.key,
    this.width = 24.0,
    this.height = 24.0,
    this.color = Colors.black,
    this.iconSize = 16.0,
    this.checkColor = Colors.black,
    required this.value,
    required this.onChanged,
  });

  final double width;
  final double height;
  final Color color;
  final double iconSize;
  final Color checkColor;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChanged?.call(!widget.value);
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(2)
        ),
        child: widget.value
            ? Icon(
          Icons.check,
          size: widget.iconSize,
          color: const Color(0xFF605966),
        )
            : null,
      ),
    );
  }
}
