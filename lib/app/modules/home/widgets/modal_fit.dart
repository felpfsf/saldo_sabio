import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_colors.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_theme.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_button.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_form_field.dart';
import 'package:saldo_sabio/app/modules/category/manage_category_module.dart';
import 'package:saldo_sabio/app/modules/transaction/manage_transaction.dart';

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
        double heightFactor = isNewCategory == true ? 0.5 : 0.75;

        return Container(
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
                  // const ManageCategory()
                  ManageCategoryModule().getPage(
                    '/category/manage-category',
                    context,
                  )
                // ManageCategory(controller: context.read())
                // Navigator.of(context).pushNamed('/manage-category')
                else
                  const ManageTransaction(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ManageCategory extends StatefulWidget {
  const ManageCategory({super.key});

  @override
  State<ManageCategory> createState() => _ManageCategoryState();
}

class _ManageCategoryState extends State<ManageCategory> {
  final formKey = GlobalKey<FormState>();
  final titleEC = TextEditingController();

  @override
  void dispose() {
    titleEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SdSbFormField(label: 'Nome da categoria', controller: titleEC),
          const SizedBox(height: 20),
          SdSbButton(onPressed: () {}, label: 'Salvar'),
        ],
      ),
    );
  }
}
