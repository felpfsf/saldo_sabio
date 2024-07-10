import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/core/auth/sd_sb_auth_provider.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_button.dart';
import 'package:saldo_sabio/app/modules/home/widgets/modal_fit.dart';

class SdSbHomeHeader extends StatelessWidget {
  const SdSbHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Selector<SdSbAuthProvider, String>(
              selector: (context, authProvider) {
                return authProvider.currentUser?.displayName ??
                    'Nome não informado';
              },
              builder: (_, value, __) {
                return Text(
                  'Olá, $value 👋', // waving hand emoji 👋
                  style: const TextStyle(color: Colors.white),
                );
              },
            ),
          ),
          SdSbButton(
            onPressed: () => showMaterialModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => const ModalFit(),
            ),
            label: 'Nova Transação',
          ),
        ],
      ),
    );
  }
}
