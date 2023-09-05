import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;

  /// Common borderRadius
  final BorderRadius? borderRadius;

  /// Common padding
  final EdgeInsetsGeometry? padding;

  /// Show ElevateButton
  final bool onlyMaterial;

  /// Show CupertinoButton
  final bool onlyCupertino;

  // Material
  final AlignmentGeometry? materialAlignment;
  final bool materialAutofocus;
  final ButtonStyle? materialButtonStyle;
  final FocusNode? materialFocusNode;
  final EdgeInsetsGeometry? materialPadding;
  final double? materialSplashRadius;

  // Cupertino
  final AlignmentGeometry cupertinoAlignment;
  final Color? cupertinoBackgroundColor;
  final BorderRadius? cupertinoBorderRadius;
  final List<BoxShadow>? cupertinoBoxShadow;
  final Color? cupertinoDisabledColor;
  final double? cupertinoMinSize;
  final EdgeInsetsGeometry? cupertinoPadding;
  final double? cupertinoPressedOpacity;
  final CupertinoThemeData? cupertinoThemeData;
  final bool useMaterialThemeOnCupertino;
  const AdaptiveIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.borderRadius,
    this.padding,
    this.onlyMaterial = false,
    this.onlyCupertino = false,

    // Material
    this.materialAlignment,
    this.materialAutofocus = false,
    this.materialButtonStyle,
    this.materialFocusNode,
    this.materialPadding,
    this.materialSplashRadius,

    // Cupertino
    this.cupertinoAlignment = Alignment.center,
    this.cupertinoBackgroundColor,
    this.cupertinoBorderRadius,
    this.cupertinoBoxShadow,
    this.cupertinoDisabledColor,
    this.cupertinoMinSize,
    this.cupertinoPadding,
    this.cupertinoPressedOpacity = 0.4,
    this.cupertinoThemeData,
    this.useMaterialThemeOnCupertino = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (!kIsWeb && Platform.isIOS || onlyCupertino) && !onlyMaterial
        ? _CupertinoIconButton(
            padding: padding,
            cupertinoPadding: cupertinoPadding,
            minSize: cupertinoMinSize,
            onPressed: onPressed,
            cupertinoBackgroundColor: cupertinoBackgroundColor,
            cupertinoAlignment: cupertinoAlignment,
            cupertinoPressedOpacity: cupertinoPressedOpacity,
            cupertinoDisabledColor: cupertinoDisabledColor,
            cupertinoBorderRadius: cupertinoBorderRadius,
            useMaterialTheme: useMaterialThemeOnCupertino,
            icon: icon,
          )
        : IconButton(
            onPressed: onPressed,
            icon: icon,
            splashRadius: materialSplashRadius ?? 24,
            padding: padding ?? materialPadding ?? EdgeInsets.zero,
            autofocus: materialAutofocus,
            focusNode: materialFocusNode,
            style: materialButtonStyle,
            alignment: materialAlignment,
          );
  }
}

class _CupertinoIconButton extends StatelessWidget {
  const _CupertinoIconButton({
    this.padding,
    this.cupertinoPadding,
    this.minSize,
    this.onPressed,
    this.cupertinoBackgroundColor,
    this.cupertinoAlignment = Alignment.center,
    this.cupertinoPressedOpacity,
    this.cupertinoDisabledColor,
    this.cupertinoBorderRadius,
    this.useMaterialTheme = false,
    required this.icon,
  });

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? cupertinoPadding;
  final double? minSize;
  final VoidCallback? onPressed;
  final Color? cupertinoBackgroundColor;
  final AlignmentGeometry cupertinoAlignment;
  final double? cupertinoPressedOpacity;
  final Color? cupertinoDisabledColor;
  final BorderRadius? cupertinoBorderRadius;
  final bool useMaterialTheme;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: padding ?? cupertinoPadding ?? EdgeInsets.zero,
      minSize: minSize ?? kMinInteractiveDimensionCupertino,
      onPressed: onPressed,
      color: cupertinoBackgroundColor,
      alignment: cupertinoAlignment,
      pressedOpacity: cupertinoPressedOpacity,
      disabledColor:
          cupertinoDisabledColor ?? CupertinoColors.quaternarySystemFill,
      borderRadius:
          cupertinoBorderRadius ?? const BorderRadius.all(Radius.circular(8.0)),
      child: useMaterialTheme
          ? Theme(
              data: Theme.of(context),
              child: icon,
            )
          : CupertinoTheme(
              data: CupertinoTheme.of(context),
              child: icon,
            ),
    );
  }
}
