import 'package:flutter/material.dart';

enum ButtonState {
  primary,
  secondary,
  disabled,
}

class StandardButton extends StatelessWidget {
  final String text;
  final ButtonState state;
  final VoidCallback? onPressed;

  const StandardButton({
    super.key,
    required this.text,
    required this.state,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (state) {
      case ButtonState.primary:
        backgroundColor = Colors.blue;
        textColor = Colors.white;
        break;
      case ButtonState.secondary:
        backgroundColor = Colors.grey;
        textColor = Colors.black;
        break;
      case ButtonState.disabled:
        backgroundColor = Colors.grey.shade400;
        textColor = Colors.grey.shade700;
        break;
    }

    return ElevatedButton(
      onPressed: state == ButtonState.disabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(color: textColor),
        backgroundColor: backgroundColor,
      ),
      child: Text(text),
    );
  }
}