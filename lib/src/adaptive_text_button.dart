import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveTextButton extends StatelessWidget {
  const AdaptiveTextButton({
    Key? key,
    required this.child,
    this.icon,
    this.onPressed,
    this.onLongPress,
    this.onlyMaterial = false,
    this.onlyCupertino = false,

    /// Material
    this.materialAutofocus = false,
    this.materialButtonStyle,
    this.materialClipBehavior = Clip.none,
    this.materialFocusNode,
    this.materialOnFocusChange,
    this.materialOnHover,
    this.materialPadding,
    this.materialStatesController,

    /// Cupertino
    this.cupertinoThemeData,
    this.cupertinoPadding,
    this.cupertinoMinSize,
    this.cupertinoDisabledColor,
    this.cupertinoAlignment = Alignment.center,
    this.cupertinoPressedOpacity = 0.4,
    this.materialOverlayColor,
  }) : super(key: key);
  const AdaptiveTextButton.icon({
    Key? key,
    required this.child,
    required this.icon,
    this.onPressed,
    this.onLongPress,
    this.onlyMaterial = false,
    this.onlyCupertino = false,

    // Material
    this.materialAutofocus = false,
    this.materialButtonStyle,
    this.materialClipBehavior = Clip.none,
    this.materialFocusNode,
    this.materialOnFocusChange,
    this.materialOnHover,
    this.materialOverlayColor,
    this.materialPadding,
    this.materialStatesController,

    // Cupertino
    this.cupertinoAlignment = Alignment.center,
    this.cupertinoDisabledColor,
    this.cupertinoMinSize,
    this.cupertinoPadding,
    this.cupertinoPressedOpacity = 0.4,
    this.cupertinoThemeData,
  }) : super(key: key);

  // Common
  final Widget child;
  final Widget? icon;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  /// Show ElevateButton
  final bool onlyMaterial;

  /// Show CupertinoButton
  final bool onlyCupertino;

  // Material
  final bool materialAutofocus;
  final ButtonStyle? materialButtonStyle;
  final Clip materialClipBehavior;
  final FocusNode? materialFocusNode;
  final ValueChanged<bool>? materialOnFocusChange;
  final ValueChanged<bool>? materialOnHover;
  final Color? materialOverlayColor;
  final EdgeInsetsGeometry? materialPadding;
  final MaterialStatesController? materialStatesController;

  // Cupertino
  final AlignmentGeometry cupertinoAlignment;
  final Color? cupertinoDisabledColor;
  final double? cupertinoMinSize;
  final EdgeInsetsGeometry? cupertinoPadding;
  final double cupertinoPressedOpacity;
  final CupertinoThemeData? cupertinoThemeData;
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      if (onlyCupertino) {
        return _buildCupertino();
      } else {
        return _buildMaterial();
      }
    }
    if ((Platform.isIOS || onlyCupertino) && !onlyMaterial) {
      return _buildCupertino();
    } else {
      return _buildMaterial();
    }
  }

  _CupertinoTextButton _buildCupertino() {
    return _CupertinoTextButton(
      onLongPress: onLongPress,
      cupertinoThemeData: cupertinoThemeData,
      onPressed: onPressed,
      cupertinoPadding: cupertinoPadding,
      cupertinoMinSize: cupertinoMinSize,
      cupertinoAlignment: cupertinoAlignment,
      cupertinoPressedOpacity: cupertinoPressedOpacity,
      cupertinoDisabledColor: cupertinoDisabledColor,
      icon: icon,
      child: child,
    );
  }

  TextButton _buildMaterial() {
    final defaultStyle = ButtonStyle(
      padding: materialPadding != null
          ? MaterialStateProperty.all(materialPadding)
          : null,
      overlayColor: materialOverlayColor != null
          ? MaterialStatePropertyAll(
              materialOverlayColor!.withOpacity(0.3),
            )
          : null,
    );
    if (icon != null) {
      return TextButton.icon(
        onPressed: onPressed,
        icon: icon!,
        autofocus: materialAutofocus,
        clipBehavior: materialClipBehavior,
        focusNode: materialFocusNode,
        onFocusChange: materialOnFocusChange,
        onHover: materialOnHover,
        onLongPress: onLongPress,
        statesController: materialStatesController,
        style: materialButtonStyle ?? defaultStyle,
        label: child,
      );
    } else {
      return TextButton(
        onPressed: onPressed,
        autofocus: materialAutofocus,
        clipBehavior: materialClipBehavior,
        focusNode: materialFocusNode,
        onFocusChange: materialOnFocusChange,
        onHover: materialOnHover,
        onLongPress: onLongPress,
        statesController: materialStatesController,
        style: materialButtonStyle ?? defaultStyle,
        child: child,
      );
    }
  }
}

class _CupertinoTextButton extends StatelessWidget {
  const _CupertinoTextButton({
    required this.onLongPress,
    required this.cupertinoThemeData,
    required this.onPressed,
    required this.cupertinoPadding,
    required this.cupertinoMinSize,
    required this.cupertinoAlignment,
    required this.cupertinoPressedOpacity,
    required this.cupertinoDisabledColor,
    required this.icon,
    required this.child,
  });

  final VoidCallback? onLongPress;
  final CupertinoThemeData? cupertinoThemeData;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? cupertinoPadding;
  final double? cupertinoMinSize;
  final AlignmentGeometry cupertinoAlignment;
  final double cupertinoPressedOpacity;
  final Color? cupertinoDisabledColor;
  final Widget? icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: CupertinoTheme(
        data: cupertinoThemeData ?? CupertinoTheme.of(context),
        child: CupertinoButton(
          onPressed: onPressed,
          padding: cupertinoPadding,
          minSize: cupertinoMinSize ?? kMinInteractiveDimensionCupertino,
          alignment: cupertinoAlignment,
          pressedOpacity: cupertinoPressedOpacity,
          disabledColor:
              cupertinoDisabledColor ?? CupertinoColors.quaternarySystemFill,
          child: icon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: icon,
                    ),
                    child,
                  ],
                )
              : child,
        ),
      ),
    );
  }
}
