import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:saldo_sabio/app/core/notifier/sd_sb_listener_notifier.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_appbar.dart';
import 'package:saldo_sabio/app/modules/home/home_controller.dart';
import 'package:saldo_sabio/app/modules/home/widgets/sd_sb_home_drawer.dart';
import 'package:saldo_sabio/app/modules/home/widgets/sd_sb_home_header.dart';
import 'package:saldo_sabio/app/modules/home/widgets/sd_sb_summary_card_row.dart';
import 'package:saldo_sabio/app/modules/home/widgets/sd_sb_transactions.dart';

class HomePage extends StatefulWidget {
  final HomeController _homeController;

  const HomePage({
    super.key,
    required HomeController homeController,
  }) : _homeController = homeController;

  // const HomePage({super.key});rHomeController
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    SdSbListenerNotifier(sdsbNotifier: widget._homeController).listener(
      context: context,
      onSuccess: (notifier, listener) {
        log('🚀 Success');
        listener.dispose();
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget._homeController.loadTransactions();
    });

    widget._homeController.loadTransactions();
  }

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
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SdSbHomeHeader(),
                      const SummaryCardRow(),
                      const SizedBox(height: 24),
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
