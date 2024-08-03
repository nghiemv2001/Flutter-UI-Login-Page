import 'package:flutter/material.dart';
import 'package:login_test/pages/login/components/custom_components/custom_checkbox.dart';

class RememberComponent extends StatefulWidget {
  const RememberComponent({super.key});

  @override
  State<RememberComponent> createState() => _RememberComponentState();
}

class _RememberComponentState extends State<RememberComponent> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 42.0, right: 8),
            child: CustomCheckbox(
              width: 16,
              height: 16,
              iconSize: 14,
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value;
                });
              },
            ),
          ),
          const Text(
            "Remember me",
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
