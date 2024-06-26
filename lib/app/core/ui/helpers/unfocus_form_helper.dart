import 'package:flutter/material.dart';

void unfocusForm(BuildContext context) {
  FocusScope.of(context).unfocus();
}

extension UnFocusExtension on BuildContext {
  void unfocus() => FocusScope.of(this).unfocus();
}
