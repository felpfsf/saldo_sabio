import 'package:flutter/material.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_colors.dart';

class SdSbAvatar extends StatelessWidget {
  final String photoURL;

  const SdSbAvatar({super.key, required this.photoURL});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: SdSbThemeColors.gray5,
      child: CircleAvatar(
        radius: 30,
        backgroundImage: photoURL.isNotEmpty
            ? NetworkImage(photoURL)
            : const AssetImage('assets/images/avatar_placeholder.png'),
      ),
    );
  }
}
