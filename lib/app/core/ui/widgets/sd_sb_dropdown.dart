import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_colors.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_theme.dart';

class SdSbDropdown<T> extends StatelessWidget {
  final ValueNotifier<T?> selectedVN;
  final List<Map<String, dynamic>> items;
  final String hintText;

  const SdSbDropdown({
    super.key,
    required this.items,
    required this.selectedVN,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T?>(
      valueListenable: selectedVN,
      builder: (context, selectedValue, child) {
        return DropdownButtonFormField2<T>(
          value: selectedValue,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 16),
          ),
          onChanged: (value) {
            selectedVN.value = value;
          },
          hint: Text(
            hintText,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: SaldoSabioTheme.textSmRegular.copyWith(fontSize: 16),
          ),
          items: items
              .map(
                (item) => DropdownMenuItem<T>(
                  value: item['id'],
                  child: Text(item['label']),
                ),
              )
              .toList(),
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 200,
            decoration: BoxDecoration(
              color: SdSbThemeColors.gray3,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        );
      },
    );
  }
}
