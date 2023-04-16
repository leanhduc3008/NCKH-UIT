import 'package:flutter/cupertino.dart';

mixin KeyboardUtils {
  static bool isKeyboardShowing() {
      return WidgetsBinding.instance.window.viewInsets.bottom > 0;

  }

  static void closeKeyboard(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
