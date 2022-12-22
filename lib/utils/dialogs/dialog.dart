import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

class AppInformationDialogs {
  StylishDialog showDialog(BuildContext context,
      StylishDialogType type) {
    StylishDialog dialog = StylishDialog(
      dismissOnTouchOutside:
          getDissmisValue(type),
      context: context,
      alertType: type,
      title: Text(getText(type)),
      content: Text(getContent(type)),
      animationLoop: true,
    );

    return dialog;
  }

  bool getDissmisValue(StylishDialogType type) {
    switch (type) {
      case StylishDialogType.ERROR:
        return true;
      case StylishDialogType.INFO:
        return true;
      case StylishDialogType.NORMAL:
        return true;
      case StylishDialogType.PROGRESS:
        return false;
      case StylishDialogType.SUCCESS:
        return true;
      case StylishDialogType.WARNING:
        return true;

      default:
        return false;
    }
  }

  String getText(StylishDialogType type) {
    switch (type) {
      case StylishDialogType.ERROR:
        return 'info.something_went_wrong'
            .translate();
      case StylishDialogType.INFO:
        return 'info.information_title'
            .translate();
      case StylishDialogType.NORMAL:
        return '';
      case StylishDialogType.PROGRESS:
        return 'info.progress'.translate();
      case StylishDialogType.SUCCESS:
        return 'info.success'.translate();
      case StylishDialogType.WARNING:
        return 'info.warning'.translate();

      default:
        return '';
    }
  }

  String getContent(StylishDialogType type) {
    switch (type) {
      case StylishDialogType.ERROR:
        return 'error.contact_provider'
            .translate();
      case StylishDialogType.INFO:

      case StylishDialogType.NORMAL:

      case StylishDialogType.PROGRESS:
        return '';
      case StylishDialogType.SUCCESS:
        return 'info.successfully'.translate();
      case StylishDialogType.WARNING:
        return '';

      default:
        return '';
    }
  }
}
