import 'package:flutter/material.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_colors.dart';

class SdSbAppBar extends AppBar {
  SdSbAppBar({
    super.key,
    String? title,
    List<Widget>? actions,
    Color backgroundColor = Colors.transparent,
    Color shadowColor = SdSbThemeColors.gray6,
    double elevation = 0,
    VoidCallback? onLeadingPressed,
    bool showLeading = true,
  }) : super(
          actions: actions,
          title: title != null ? SdSbAppbarTitle(title: title) : null,
          iconTheme: const IconThemeData(color: SdSbThemeColors.white),
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          leading: showLeading
              ? IconButton(
                  onPressed: onLeadingPressed ?? () {},
                  icon: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: SdSbThemeColors.white.withOpacity(.4),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                )
              : null,
        );
}

class SdSbAppbarTitle extends StatelessWidget {
  final String title;

  const SdSbAppbarTitle({
    super.key,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Saldo Sábio',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }
}
