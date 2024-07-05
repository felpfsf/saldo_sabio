import 'package:flutter/material.dart';
import 'package:saldo_sabio/app/core/ui/helpers/unfocus_form_helper.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_colors.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_theme.dart';

class SdSbFormField extends StatelessWidget {
  final String label;
  final String? hintText;
  final IconButton? iconButton;
  final TextInputType? keyboardType;
  final bool obscureText;
  final ValueNotifier<bool> obscureTextNotifier;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;

  SdSbFormField({
    super.key,
    required this.label,
    this.hintText,
    this.iconButton,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.controller,
    this.focusNode,
    this.validator,
  })  : assert(
          obscureText == true ? iconButton == null : true,
          'Icon button must be null if obscure text is true',
        ),
        obscureTextNotifier = ValueNotifier(obscureText);

  @override
  Widget build(BuildContext context) {
    void obscureTextChange() {
      obscureTextNotifier.value = !obscureTextNotifier.value;
    }

    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextNotifier,
      builder: (context, obscureTextValue, child) {
        return TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          focusNode: focusNode,
          validator: validator,
          onTapOutside: (_) => unfocusForm(context),
          obscureText: obscureTextValue,
          decoration: InputDecoration(
            labelText: label,
            hintText: hintText,
            suffixIcon: iconButton ??
                (obscureText == true
                    ? IconButton(
                        onPressed: obscureTextChange,
                        icon: Icon(
                          obscureTextNotifier.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        color: SdSbThemeColors.gray6,
                        iconSize: 14,
                      )
                    : null),
          ),
          style: SaldoSabioTheme.textSmRegular.copyWith(
            color: SdSbThemeColors.white,
          ),
        );
      },
    );
  }
}
