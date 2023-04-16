import 'package:flutter/material.dart';

import '../../../common/constants/dimens.dart';
import '../../../common/constants/icons.dart';
import '../../../common/constants/theme.dart';
import '../../../common/extension/extenstion.dart';
import '../../../widgets/icon/svg_icon.dart';
import '../../../widgets/input/app_text_form_field.dart';
import '../../../widgets/input/border_input_decoration.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({super.key, this.hintText, this.onSubmitted});

  final String? hintText;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 270,
          height: 54,
          decoration: BoxDecoration(
            color: AppColors.softGray,
            borderRadius: BorderRadius.circular(21.0),
          ),
          child: AppTextFormField(
            decoration: BorderInputDecoration(
              borderRadius: 21.borderRadius,
              borderColor: AppColors.softGray,
              filled: true,
              fillColor: AppColors.softGray,
              hintText: hintText,
              hintStyle: context.textStyle.bodySmall?.weight400
                  .copyWith(color: AppColors.grayText.withOpacity(0.8)),
              contentPadding: const EdgeInsets.all(Dimens.s3),
              prefixIcon: Container(
                margin: const EdgeInsets.all(15),
                child: const SvgIcon(
                  AppIcons.icSearch,
                ),
              ),
            ),
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (value) => onSubmitted,
            onSaved: (value) => onSubmitted,
          ),
        )
      ],
    );
  }
}
