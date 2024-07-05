import 'package:flutter/material.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_theme.dart';

class SdSbLogo extends StatelessWidget {
  final bool enableTitle;

  const SdSbLogo({
    super.key,
    this.enableTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/sd_sb_logo_white.png',
        ),
        const SizedBox(height: 8),
        Visibility(
          visible: enableTitle,
          child: const Text(
            'Saldo Sábio',
            style: SaldoSabioTheme.text2XlBold,
          ),
        ),
      ],
    );
  }
}
