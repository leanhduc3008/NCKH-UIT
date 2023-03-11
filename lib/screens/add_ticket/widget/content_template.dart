import 'package:flutter/material.dart';

import '../../../common/constants/dimens.dart';
import '../../../common/extension/extenstion.dart';
import '../../../widgets/button/elevated_button.dart';

class ContentTemplate extends StatelessWidget {
  const ContentTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: Dimens.s4.borderRadius),
      backgroundColor: context.colorScheme.background,
      child: Container(
        padding: Dimens.s3.insetAll,
        width: Dimens.s8 * 10,
        height: Dimens.s10 * 10,
        child: Column(
          children: [
            Text('Content template', style: context.textStyle.titleMedium),
            Expanded(
              child: ListView.builder(itemBuilder: _builditem),
            ),
            const SizedBox(height: Dimens.s3),
            AppElevatedButton(
              child: const Text('Add'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget _builditem(BuildContext context, int index) => InkWell(
        onTap: () => Navigator.of(context).pop(index.toString()),
        child: Padding(
          padding: Dimens.s1.insetAll.add(Dimens.s1.insetHorizontal),
          child: Text(
            '$index',
            style: context.textStyle.titleSmall,
            maxLines: 1,
          ),
        ),
      );
}
