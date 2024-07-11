import 'package:flutter/material.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_appbar.dart';
import 'package:saldo_sabio/app/modules/home/widgets/sd_sb_home_drawer.dart';
import 'package:saldo_sabio/app/modules/home/widgets/sd_sb_home_header.dart';
import 'package:saldo_sabio/app/modules/home/widgets/sd_sb_summary_card_row.dart';
import 'package:saldo_sabio/app/modules/home/widgets/sd_sb_transactions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: SdSbAppBar(
        showLeading: false,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Mostrar Todas'),
              ),
              const PopupMenuItem(
                child: Text('Mostrar Entradas'),
              ),
              const PopupMenuItem(
                child: Text('Mostrar Saídas'),
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
                child: const IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SdSbHomeHeader(),
                      SummaryCardRow(),
                      SizedBox(height: 24),
                      Transactions(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
