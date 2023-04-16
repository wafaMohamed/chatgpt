import 'package:flutter/material.dart';

import '../constants/themes/app_theme.dart';
import '../view/widget/custom_text.dart';
import '../view/widget/drop_down.dart';

class Services {
  static Future<void> showModalSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        backgroundColor: AppTheme.scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  child: TextWidget(
                    label: "Chosen Model:",
                    fontSize: 16,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: DropDownModel(),
                ),
              ],
            ),
          );
        });
  }
}
