import 'package:flutter/material.dart';
import 'package:login_test/pages/login/components/input_filed.dart';
import 'package:login_test/pages/login/components/remember.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> with TickerProviderStateMixin {
  late AnimationController _userAnimationController;
  late AnimationController _userBorderColorAnimationController;
  late Animation<double> _userBorderColorAnimation;
  late Animation<double> _userIconSizeAnimation;

  late AnimationController _passAnimationController;
  late AnimationController _passBorderColorAnimationController;
  late Animation<double> _passBorderColorAnimation;
  late Animation<double> _passIconSizeAnimation;

  final FocusNode _userFocusNode = FocusNode();
  final FocusNode _passFocusNode = FocusNode();

  late EdgeInsets _userContentPadding;
  late EdgeInsets _passContentPadding;
  String _userPlaceholder = 'Username';
  String _passPlaceholder = 'Password';

  double _userBorderHeight = 1.0;
  double _passBorderHeight = 1.0;

  @override
  void initState() {
    super.initState();
    _userAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _userBorderColorAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _userBorderColorAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _userBorderColorAnimationController,
      curve: Curves.easeInOut,
    ));
    _userIconSizeAnimation = Tween<double>(
      begin: 22.0,
      end: 18.0,
    ).animate(CurvedAnimation(
      parent: _userAnimationController,
      curve: Curves.easeInOut,
    ));
    _userContentPadding = const EdgeInsets.only(left: 40.0);
    _userFocusNode.addListener(() {
      if (_userFocusNode.hasFocus) {
        setState(() {
          _userContentPadding = const EdgeInsets.only(left: 5);
          _userPlaceholder = '';
          _userBorderHeight = 2.0;
        });
        _userAnimationController.forward();
        _userBorderColorAnimationController.forward();
      } else {
        setState(() {
          _userContentPadding = const EdgeInsets.only(left: 40.0);
          _userPlaceholder = 'Username';
          _userBorderHeight = 1.0;
        });
        _userAnimationController.reverse();
        _userBorderColorAnimationController.reverse();
      }
    });
    _passAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _passBorderColorAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _passBorderColorAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _passBorderColorAnimationController,
      curve: Curves.easeInOut,
    ));
    _passIconSizeAnimation = Tween<double>(
      begin: 22.0,
      end: 18.0,
    ).animate(CurvedAnimation(
      parent: _passAnimationController,
      curve: Curves.easeInOut,
    ));
    _passContentPadding = const EdgeInsets.only(left: 40.0);
    _passFocusNode.addListener(() {
      if (_passFocusNode.hasFocus) {
        setState(() {
          _passContentPadding = const EdgeInsets.only(left: 5);
          _passPlaceholder = '';
          _passBorderHeight = 2.0;
        });
        _passAnimationController.forward();
        _passBorderColorAnimationController.forward();
      } else {
        setState(() {
          _passContentPadding = const EdgeInsets.only(left: 40.0);
          _passPlaceholder = 'Password';
          _passBorderHeight = 1.0;
        });
        _passAnimationController.reverse();
        _passBorderColorAnimationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _userAnimationController.dispose();
    _userBorderColorAnimationController.dispose();
    _passAnimationController.dispose();
    _passBorderColorAnimationController.dispose();
    _userFocusNode.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextField(
          focusNode: _userFocusNode,
          placeholder: _userPlaceholder,
          icon: Icons.person,
          isPassword: false,
          animationController: _userAnimationController,
          borderColorAnimationController: _userBorderColorAnimationController,
          borderColorAnimation: _userBorderColorAnimation,
          iconSizeAnimation: _userIconSizeAnimation,
          contentPadding: _userContentPadding,
          borderHeight: _userBorderHeight,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          focusNode: _passFocusNode,
          placeholder: _passPlaceholder,
          icon: Icons.lock,
          isPassword: true,
          animationController: _passAnimationController,
          borderColorAnimationController: _passBorderColorAnimationController,
          borderColorAnimation: _passBorderColorAnimation,
          iconSizeAnimation: _passIconSizeAnimation,
          contentPadding: _passContentPadding,
          borderHeight: _passBorderHeight,
        ),
        const SizedBox(height: 30),
        Container(
            margin: const EdgeInsets.only(left: 15),
            child: const RememberComponent()),
        const SizedBox(height: 30),
      ],
    );
  }
}
