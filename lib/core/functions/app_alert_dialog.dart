import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../translations/locale_keys.g.dart';
import '../utilities/appKeys.dart';

class AppAlertDialog {
  static void showSuccessBar({
    String? message,
  }) {
    if (AppKeys.materialKey.currentContext != null &&
        (AppKeys.materialKey.currentContext!.mounted)) {
      Flushbar(
        isDismissible: true,
        message: message ?? LocaleKeys.doneSuccessfully.tr(),
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.green,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.GROUNDED,
      ).show(AppKeys.materialKey.currentContext!);
    }
  }

  static void showErrorBar({
    String? errorMessage,
    bool? autoHide = true,
    bool? isDismissible = true,
  }) {
    if (errorMessage != null) {
      if (errorMessage.isEmpty) {
        errorMessage = LocaleKeys.someThingWentWrong.tr();
      }
    } else {
      errorMessage = LocaleKeys.someThingWentWrong.tr();
    }
    if (AppKeys.materialKey.currentContext != null &&
        (AppKeys.materialKey.currentContext!.mounted)) {
      Flushbar(
        isDismissible: isDismissible ?? true,
        message: errorMessage,
        duration: autoHide ?? true ? const Duration(seconds: 5) : null,
        backgroundColor: Colors.redAccent,
      ).show(AppKeys.materialKey.currentContext!);
    }
  }
}
