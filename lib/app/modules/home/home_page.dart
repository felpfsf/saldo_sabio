import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/core/auth/sd_sb_auth_provider.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_appbar.dart';
import 'package:saldo_sabio/app/modules/home/widgets/sd_sb_home_drawer.dart';
import 'package:saldo_sabio/app/modules/home/widgets/sd_sb_home_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _logout(BuildContext context) {
    context.read<SdSbAuthProvider>().logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SdSbAppBar(
        showLeading: false,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('data'),
              ),
            ],
          ),
        ],
      ),
      drawer: const SdSbDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SdSbHomeHeader(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
