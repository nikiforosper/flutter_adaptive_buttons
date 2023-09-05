// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveElevatedButton extends StatelessWidget {
  const AdaptiveElevatedButton({
    Key? key,
    required this.child,
    this.icon,
    this.onPressed,
    this.onLongPress,
    this.color,
    this.borderRadius,
    this.onlyMaterial = false,
    this.onlyCupertino = false,

    /// Material
    this.materialAutofocus = false,
    this.materialBorderRadius,
    this.materialButtonStyle,
    this.materialClipBehavior = Clip.none,
    this.materialFocusNode,
    this.materialOnFocusChange,
    this.materialOnHover,
    this.materialOverlayColor,
    this.materialPadding,
    this.materialShape,
    this.materialStatesController,

    /// Cupertino
    this.cupertinoAlignment = Alignment.center,
    this.cupertinoBorderRadius,
    this.cupertinoBoxShadow,
    this.cupertinoDisabledColor,
    this.cupertinoHasElevation = false,
    this.cupertinoMinSize,
    this.cupertinoPadding,
    this.cupertinoPressedOpacity = 0.4,
    this.cupertinoThemeData,
  }) : super(key: key);
  const AdaptiveElevatedButton.icon({
    Key? key,
    required this.child,
    required this.icon,
    this.onPressed,
    this.onLongPress,
    this.color,
    this.borderRadius,
    this.onlyMaterial = false,
    this.onlyCupertino = false,

    /// Material
    this.materialAutofocus = false,
    this.materialBorderRadius,
    this.materialButtonStyle,
    this.materialClipBehavior = Clip.none,
    this.materialFocusNode,
    this.materialOnFocusChange,
    this.materialOnHover,
    this.materialOverlayColor,
    this.materialPadding,
    this.materialShape,
    this.materialStatesController,

    /// Cupertino
    this.cupertinoAlignment = Alignment.center,
    this.cupertinoBorderRadius,
    this.cupertinoBoxShadow,
    this.cupertinoDisabledColor,
    this.cupertinoHasElevation = false,
    this.cupertinoMinSize,
    this.cupertinoPadding,
    this.cupertinoPressedOpacity = 0.4,
    this.cupertinoThemeData,
  }) : super(key: key);

  //Common
  final Widget child;
  final Widget? icon;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  /// The background color
  final Color? color;

  /// Common borderRadius
  final BorderRadius? borderRadius;

  /// Show ElevateButton
  final bool onlyMaterial;

  /// Show CupertinoButton
  final bool onlyCupertino;

  // Material
  final bool materialAutofocus;
  final BorderRadius? materialBorderRadius;
  final ButtonStyle? materialButtonStyle;
  final Clip materialClipBehavior;
  final FocusNode? materialFocusNode;
  final ValueChanged<bool>? materialOnFocusChange;
  final ValueChanged<bool>? materialOnHover;
  final Color? materialOverlayColor;
  final EdgeInsetsGeometry? materialPadding;
  final OutlinedBorder? materialShape;
  final MaterialStatesController? materialStatesController;

  // Cupertino
  final AlignmentGeometry cupertinoAlignment;
  final BorderRadius? cupertinoBorderRadius;
  final List<BoxShadow>? cupertinoBoxShadow;
  final Color? cupertinoDisabledColor;
  final bool cupertinoHasElevation;
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
    } else if ((Platform.isIOS || onlyCupertino) && !onlyMaterial) {
      return _buildCupertino();
    } else {
      return _buildMaterial();
    }
  }

  _CupertinoElevatedButton _buildCupertino() {
    var kCupertinoBorderRadius = materialShape == const StadiumBorder()
        ? BorderRadius.circular(100.0)
        : cupertinoBorderRadius ?? borderRadius ?? BorderRadius.circular(9.0);
    return _CupertinoElevatedButton(
      onLongPress: onLongPress,
      cupertinoElevation: cupertinoHasElevation,
      cupertinoBoxShadow: cupertinoBoxShadow,
      cupertinoThemeData: cupertinoThemeData,
      onPressed: onPressed,
      cupertinoPadding: cupertinoPadding,
      cupertinoMinSize: cupertinoMinSize,
      color: color,
      cupertinoAlignment: cupertinoAlignment,
      cupertinoPressedOpacity: cupertinoPressedOpacity,
      cupertinoDisabledColor: cupertinoDisabledColor,
      borderRadius: kCupertinoBorderRadius,
      icon: icon,
      child: child,
    );
  }

  ElevatedButton _buildMaterial() {
    final defaultStyle = ButtonStyle(
      backgroundColor: color != null ? MaterialStateProperty.all(color) : null,
      padding: materialPadding != null
          ? MaterialStateProperty.all(materialPadding)
          : null,
      overlayColor: materialOverlayColor != null
          ? MaterialStatePropertyAll(materialOverlayColor!.withOpacity(0.3))
          : null,
      shape: MaterialStateProperty.all(
        materialBorderRadius != null || borderRadius != null
            ? RoundedRectangleBorder(
                borderRadius: materialBorderRadius ?? borderRadius!)
            : materialShape,
      ),
    );

    return icon != null
        ? ElevatedButton.icon(
            onPressed: onPressed,
            icon: icon!,
            onLongPress: onLongPress,
            autofocus: materialAutofocus,
            clipBehavior: materialClipBehavior,
            focusNode: materialFocusNode,
            onFocusChange: materialOnFocusChange,
            onHover: materialOnHover,
            statesController: materialStatesController,
            style: materialButtonStyle ?? defaultStyle,
            label: child,
          )
        : ElevatedButton(
            onPressed: onPressed,
            onLongPress: onLongPress,
            autofocus: materialAutofocus,
            clipBehavior: materialClipBehavior,
            focusNode: materialFocusNode,
            onFocusChange: materialOnFocusChange,
            onHover: materialOnHover,
            statesController: materialStatesController,
            style: materialButtonStyle ?? defaultStyle,
            child: child,
          );
  }
}

class _CupertinoElevatedButton extends StatelessWidget {
  const _CupertinoElevatedButton({
    required this.onLongPress,
    required this.cupertinoElevation,
    required this.cupertinoBoxShadow,
    required this.cupertinoThemeData,
    required this.onPressed,
    required this.cupertinoPadding,
    required this.cupertinoMinSize,
    required this.color,
    required this.cupertinoAlignment,
    required this.cupertinoPressedOpacity,
    required this.cupertinoDisabledColor,
    required this.icon,
    required this.child,
    this.borderRadius,
  });

  final VoidCallback? onLongPress;
  final bool cupertinoElevation;
  final List<BoxShadow>? cupertinoBoxShadow;
  final CupertinoThemeData? cupertinoThemeData;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? cupertinoPadding;
  final double? cupertinoMinSize;
  final Color? color;
  final AlignmentGeometry cupertinoAlignment;
  final double cupertinoPressedOpacity;
  final Color? cupertinoDisabledColor;
  final Widget? icon;
  final Widget child;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Container(
        decoration: cupertinoElevation || cupertinoBoxShadow != null
            ? BoxDecoration(
                boxShadow: cupertinoBoxShadow ??
                    [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                borderRadius: borderRadius,
              )
            : null,
        child: CupertinoTheme(
          data: cupertinoThemeData ?? CupertinoTheme.of(context),
          child: CupertinoButton(
            onPressed: onPressed,
            padding: cupertinoPadding,
            minSize: cupertinoMinSize ?? kMinInteractiveDimensionCupertino,
            color: color,
            alignment: cupertinoAlignment,
            pressedOpacity: cupertinoPressedOpacity,
            disabledColor:
                cupertinoDisabledColor ?? CupertinoColors.quaternarySystemFill,
            borderRadius: borderRadius,
            child: icon != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: icon!,
                      ),
                      child,
                    ],
                  )
                : child,
          ),
        ),
      ),
    );
  }
}
