import 'package:flutter/material.dart';

import '../../common/constants/dimens.dart';
import '../../common/constants/theme.dart';
import '../../common/extension/context_extension.dart';
import '../../common/extension/text_extension.dart';
import '../input/app_text_form_field.dart';
import '../input/border_input_decoration.dart';

class AppNavbar extends StatelessWidget with PreferredSizeWidget {
  const AppNavbar({
    super.key,
    this.automaticallyImplyLeading = true,
    this.foregroundColor,
    this.backgroundColor,
    this.title,
    this.leading,
    this.elevation,
    this.actions,
    this.bottom,
  });

  factory AppNavbar.search({
    Key? key,
    bool automaticallyImplyLeading = true,
    Color? foregroundColor,
    Color? backgroundColor,
    String? title,
    Widget? leading,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    String hintText = 'Hint text',
    ValueChanged<String>? onSubmitted,
  }) {
    return AppNavbar(
      key: key,
      automaticallyImplyLeading: automaticallyImplyLeading,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      title: title ?? '',
      leading: leading,
      actions: actions,
      bottom: _SearchNavbar(hintText, onSubmitted, bottom),
    );
  }

  final String? title;
  final bool automaticallyImplyLeading;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Widget? leading;
  final List<Widget>? actions;
  final double? elevation;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    final foreground = foregroundColor ?? context.colorScheme.onPrimary;
    final background = backgroundColor ?? AppColors.darkGreen;

    return PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ]),
            child: AppBar(
              elevation: elevation,
              shadowColor: AppColors.transparentColor,
              centerTitle: false,
              foregroundColor: foreground,
              backgroundColor: background,
              iconTheme: IconThemeData(color: foreground),
              actionsIconTheme: IconThemeData(color: foreground),
              titleSpacing: Dimens.s2,
              titleTextStyle:
                  context.textStyle.titleMedium?.copyWith(color: foreground),
              leading: _buildLeading(context, foreground),
              title: Text(title ?? ''),
              actions: actions
                  ?.map((icon) => Padding(
                        padding: const EdgeInsets.only(right: Dimens.s3),
                        child: icon,
                      ))
                  .toList(),
              bottom: bottom,
            )));
  }

  Widget? _buildLeading(BuildContext context, Color color) {
    final ScaffoldState? scaffold = Scaffold.maybeOf(context);
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool hasDrawer = scaffold?.hasDrawer ?? false;
    final bool hasEndDrawer = scaffold?.hasEndDrawer ?? false;
    final bool canPop = parentRoute?.canPop ?? false;
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;
    Widget? leading = this.leading;
    if (leading == null && automaticallyImplyLeading) {
      if (hasDrawer) {
        leading = IconButton(
          icon: const Icon(Icons.menu),
          color: color,
          iconSize: 24,
          onPressed: scaffold?.openDrawer,
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      } else if ((!hasEndDrawer && canPop) ||
          (parentRoute?.impliesAppBarDismissal ?? false)) {
        leading = useCloseButton
            ? CloseButton(color: color)
            : BackButton(color: color);
      }
    }
    if (leading != null) {
      leading = ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: kToolbarHeight),
        child: leading,
      );
    }

    return leading;
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}

class _SearchNavbar extends StatelessWidget with PreferredSizeWidget {
  const _SearchNavbar(this.hintText, this.onSubmitted, this.bottom);

  final String hintText;
  final ValueChanged<String>? onSubmitted;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.s3,
            vertical: Dimens.s2,
          ),
          child: AppTextFormField(
            decoration: BorderInputDecoration(
              filled: true,
              fillColor: AppColors.softGray,
              hintText: hintText,
              hintStyle: context.textStyle.titleSmall?.weight400
                  .copyWith(color: AppColors.grayText.withOpacity(0.8)),
              contentPadding: const EdgeInsets.symmetric(horizontal: Dimens.s3),
              suffixIcon: const Icon(Icons.search),
            ),
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (value) => onSubmitted,
            onSaved: (value) => onSubmitted,
          ),
        ),
        if (bottom != null) bottom!,
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
