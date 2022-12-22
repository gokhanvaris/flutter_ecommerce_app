import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ValidatorController extends GetxController {
  dynamic emptyValidator(String val) {
    return val.isEmpty
        ? "empty_field_error".translate()
        : null;
  }
}
