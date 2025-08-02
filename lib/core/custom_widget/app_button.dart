import 'package:social_media_app/core/custom_widget/app_icon.dart';
import 'package:social_media_app/core/custom_widget/app_text.dart';
import 'package:social_media_app/core/extension/context.dart';
import 'package:social_media_app/core/extension/theme.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onTap,
    this.iconData,
    this.colorButton,
    this.sizeButton,
    this.titleColor,
  });

  final Function()? onTap;
  final String title;
  final IconData? iconData;
  final Color? colorButton;
  final Color? titleColor;
  final Size? sizeButton;
  ButtonStyle buttonStyle({required BuildContext context}) =>
      ElevatedButton.styleFrom(
        fixedSize: sizeButton,
        backgroundColor: colorButton ?? context.theme.buttonColor,
      );

  @override
  Widget build(BuildContext context) {
    if (iconData != null) {
      ElevatedButton.icon(
        style: buttonStyle(context: context),
        onPressed: onTap,
        label: AppText(text: title, textColor: titleColor ?? Colors.white),
        icon: AppIcon(icon: iconData!),
      );
    }
    return ElevatedButton(
      onPressed: onTap,
      style: buttonStyle(context: context),
      child: AppText(text: title, textColor: titleColor ?? Colors.white),
    );
  }
}
