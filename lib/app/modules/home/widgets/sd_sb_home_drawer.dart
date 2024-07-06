import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/core/auth/sd_sb_auth_provider.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_colors.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_avatar.dart';

class SdSbDrawer extends StatelessWidget {
  const SdSbDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 25,
      width: 256,
      backgroundColor: SdSbThemeColors.gray2,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: SdSbThemeColors.gray3.withAlpha(70),
            ),
            child: Row(
              children: [
                Selector<SdSbAuthProvider, String>(
                  selector: (context, authProvider) {
                    return authProvider.currentUser?.photoURL ?? '';
                  },
                  builder: (_, value, __) {
                    return SdSbAvatar(photoURL: value);
                  },
                ),
                const SizedBox(width: 8),
                Selector<SdSbAuthProvider, String>(
                  selector: (context, authProvider) {
                    return authProvider.currentUser?.displayName ?? '';
                  },
                  builder: (_, value, __) {
                    return Text(
                      value,
                      style: const TextStyle(color: Colors.white),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
