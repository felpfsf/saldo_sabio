import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_colors.dart';

class SdSbLoader extends StatelessWidget {
  const SdSbLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: LoadingAnimationWidget.prograssiveDots(
      //   color: SdSbThemeColors.greenLight,
      //   size: 50,
      // ),
      child: LoadingAnimationWidget.dotsTriangle(
        color: SdSbThemeColors.white,
        size: 50,
      ),
    );
  }
}
