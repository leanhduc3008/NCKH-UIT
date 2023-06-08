import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../common/extension/extenstion.dart';
import '../../common/constants/styles.dart';
import '../../common/constants/theme.dart';

extension DefaultBottomSheetExtensionGetX on GetInterface {
  Future<T?> showDefaultBottomSheet<T>(
    DefaultBottomSheet<T> bottomSheet, {
    double? heightFactor,
    bool ignoreSafeArea = false,
    Duration? timeClose,
  }) {
    return Get.bottomSheet<T>(
      exitBottomSheetDuration: timeClose,
      ignoreSafeArea: ignoreSafeArea,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: AppColors.white,
      heightFactor != null
          ? FractionallySizedBox(
              heightFactor: heightFactor,
              child: bottomSheet.copyWith(
                child: Expanded(child: bottomSheet.child),
              ),
            )
          : bottomSheet,
    );
  }
}

class DefaultBottomSheet<T> extends StatelessWidget {
  const DefaultBottomSheet({
    super.key,
    this.title,
    required this.child,
  });

  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: FocusScope.of(context).unfocus, child: child);
  }

  void closeBottomSheet({T? result}) {
    if (Get.isBottomSheetOpen ?? false) {
      return Get.back<T>(result: result);
    }
  }

  DefaultBottomSheet<T> copyWith({
    Key? key,
    String? title,
    Widget? child,
  }) =>
      DefaultBottomSheet<T>(
        key: key ?? this.key,
        title: title ?? this.title,
        child: child ?? this.child,
      );
}

class DefaultBottomSheetBody extends StatelessWidget {
  const DefaultBottomSheetBody({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    required this.icon,
    this.bottom,
  });

  final String icon;
  final String title;
  final String content;
  final List<Widget> actions;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 23),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            18.gapHeight,
            Text(title,
                style: AppStyles.titleMedium, textAlign: TextAlign.center),
            16.gapHeight,
            Text(content.replaceAll(RegExp(r'(\n)+'), '\n\n'),
                style: AppStyles.bodyMedium, textAlign: TextAlign.center),
            24.gapHeight,
            _buildActions(),
            if (bottom == null) 0.gapHeight else 16.gapHeight,
            bottom ?? Container()
          ],
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: actions
          .map((e) => Flexible(child: e))
          .applySeparator(15.gapWidth)
          .toList(),
    );
  }
}
