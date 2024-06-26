import 'package:flutter/material.dart';

enum ButtonType { elevate, outlined }

class SaldoSabioButtom extends StatelessWidget {
  final String? label;
  final Icon? icon;
  final VoidCallback onPressed;
  final ButtonType buttonType;
  final ButtonStyle? style;
  final double? width;
  final double? height;

  const SaldoSabioButtom({
    super.key,
    this.label,
    this.icon,
    this.style,
    this.width,
    this.height,
    this.buttonType = ButtonType.elevate,
    required this.onPressed,
  }) : assert(
          label != null || icon != null,
          'You must provide a label or an icon',
        );

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (label != null && icon != null) {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon!,
          const SizedBox(width: 8),
          Text(label!),
        ],
      );
    } else if (icon != null) {
      child = Center(child: icon!);
    } else {
      child = Center(child: Text(label!));
    }

    switch (buttonType) {
      case ButtonType.elevate:
        return SizedBox(
          width: width,
          height: height,
          child: ElevatedButton(
            onPressed: onPressed,
            style: style,
            child: child,
          ),
        );
      case ButtonType.outlined:
        return SizedBox(
          width: width,
          height: height,
          child: OutlinedButton(
            onPressed: onPressed,
            style: style,
            child: child,
          ),
        );
      default:
        return SizedBox(
          width: width,
          height: height,
          child: ElevatedButton(
            onPressed: onPressed,
            style: style,
            child: child,
          ),
        );
    }
  }
}
