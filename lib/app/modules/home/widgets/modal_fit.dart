import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_colors.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_theme.dart';
import 'package:saldo_sabio/app/modules/category/manage_category_module.dart';
import 'package:saldo_sabio/app/modules/transaction/manage_transaction_module.dart';

class ModalFit extends StatelessWidget {
  final bool? isNewCategory;

  const ModalFit({
    super.key,
    this.isNewCategory = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double heightFactor = isNewCategory == true ? 0.5 : 0.85;
        double bottom = MediaQuery.of(context).viewInsets.bottom;

        return Padding(
          padding: EdgeInsets.only(bottom: bottom),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: constraints.maxHeight * heightFactor,
            ),
            width: constraints.maxWidth,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: SdSbThemeColors.gray2,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isNewCategory == true ? 'Nova Categoria' : 'Nova Transação',
                    style: SaldoSabioTheme.textXlBold,
                  ),
                  const SizedBox(height: 32),
                  if (isNewCategory == true)
                    ManageCategoryModule().getPage(
                      '/category/manage-category',
                      context,
                    )
                  else
                    ManageTransactionModule().getPage(
                      '/transaction/manage-transaction',
                      context,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
