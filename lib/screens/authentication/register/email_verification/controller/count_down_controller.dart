import 'dart:async';

import '../../../../../common/base/base_view_model.dart';

class CountdownController extends BaseViewModel<int> {
  int maxCountDown = 60;
  Timer? timerCountDown;

  @override
  Future<int> initialData() async {
    return maxCountDown;
  }

  void startCountDownXSeconds(int x) {
    timerCountDown = Timer.periodic(Duration(seconds: x), (timer) {
      maxCountDown = maxCountDown - x;

      final int newValue = maxCountDown;

      change(newValue);

      if (maxCountDown <= 0) {
        timerCountDown?.cancel();
      }
    });
  }

  void resetToInitial() {
    maxCountDown = 60;
    change(maxCountDown);
  }
}
