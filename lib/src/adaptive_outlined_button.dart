import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveOutlinedButton extends StatelessWidget {
  const AdaptiveOutlinedButton({
    Key? key,
    required this.child,
    this.icon,
    this.onPressed,
    this.onLongPress,
    this.borderColor,
    this.borderRadius,
    this.onlyMaterial = false,
    this.onlyCupertino = false,

    // Material
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

    // Cupertino
    this.cupertinoAlignment = Alignment.center,
    this.cupertinoBorderRadius,
    this.cupertinoDisabledColor,
    this.cupertinoMinSize,
    this.cupertinoPadding,
    this.cupertinoPressedOpacity = 0.4,
    this.cupertinoThemeData,
  }) : super(key: key);
  const AdaptiveOutlinedButton.icon({
    Key? key,
    required this.child,
    required this.icon,
    this.onPressed,
    this.onLongPress,
    this.borderColor,
    this.borderRadius,
    this.onlyMaterial = false,
    this.onlyCupertino = false,

    // Material
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

    // Cupertino
    this.cupertinoAlignment = Alignment.center,
    this.cupertinoBorderRadius,
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

  /// Border color
  final Color? borderColor;

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
  final Color? cupertinoDisabledColor;
  final double? cupertinoMinSize;
  final EdgeInsetsGeometry? cupertinoPadding;
  final double cupertinoPressedOpacity;
  final CupertinoThemeData? cupertinoThemeData;
  @override
  Widget build(BuildContext context) {
    Color kBorderColor = borderColor ??
        Theme.of(context).buttonTheme.colorScheme?.outline ??
        const Color(0xFF000000);

    if (kIsWeb) {
      if (onlyCupertino) {
        return _buildCupertino(kBorderColor);
      } else {
        return _buildMaterial(kBorderColor);
      }
    } else if ((Platform.isIOS || onlyCupertino) && !onlyMaterial) {
      return _buildCupertino(kBorderColor);
    } else {
      return _buildMaterial(kBorderColor);
    }
  }

  _CupertinoOutlinedButton _buildCupertino(Color kBorderColor) {
    return _CupertinoOutlinedButton(
      onLongPress: onLongPress,
      materialShape: materialShape,
      cupertinoBorderRadius: cupertinoBorderRadius,
      borderRadius: borderRadius,
      kBorderColor: kBorderColor,
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

  OutlinedButton _buildMaterial(Color kBorderColor) {
    var defaultStyle = ButtonStyle(
      padding: MaterialStateProperty.all(materialPadding),
      overlayColor: materialOverlayColor != null || borderColor != null
          ? MaterialStatePropertyAll(
              materialOverlayColor ?? borderColor!.withOpacity(0.3))
          : null,
      shape: MaterialStateProperty.all(
        materialBorderRadius != null || borderRadius != null
            ? RoundedRectangleBorder(
                borderRadius: materialBorderRadius ?? borderRadius!)
            : materialShape,
      ),
      side: MaterialStateProperty.all(BorderSide(color: kBorderColor)),
    );
    if (icon != null) {
      return OutlinedButton.icon(
        onPressed: onPressed,
        icon: icon!,
        autofocus: materialAutofocus,
        clipBehavior: materialClipBehavior,
        focusNode: materialFocusNode,
        onLongPress: onLongPress,
        statesController: materialStatesController,
        style: materialButtonStyle ?? defaultStyle,
        label: child,
      );
    } else {
      return OutlinedButton(
        onPressed: onPressed,
        onFocusChange: materialOnFocusChange,
        onHover: materialOnHover,
        autofocus: materialAutofocus,
        clipBehavior: materialClipBehavior,
        focusNode: materialFocusNode,
        onLongPress: onLongPress,
        statesController: materialStatesController,
        style: materialButtonStyle ?? defaultStyle,
        child: child,
      );
    }
  }
}

class _CupertinoOutlinedButton extends StatefulWidget {
  const _CupertinoOutlinedButton({
    required this.onLongPress,
    required this.materialShape,
    required this.cupertinoBorderRadius,
    required this.borderRadius,
    required this.kBorderColor,
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
  final OutlinedBorder? materialShape;
  final BorderRadius? cupertinoBorderRadius;
  final BorderRadius? borderRadius;
  final Color kBorderColor;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? cupertinoPadding;
  final double? cupertinoMinSize;
  final AlignmentGeometry cupertinoAlignment;
  final double cupertinoPressedOpacity;
  final Color? cupertinoDisabledColor;
  final Widget? icon;
  final Widget child;

  @override
  State<_CupertinoOutlinedButton> createState() =>
      _CupertinoOutlinedButtonState();
}

class _CupertinoOutlinedButtonState extends State<_CupertinoOutlinedButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    BorderRadius kBorderRadius = widget.materialShape == const StadiumBorder()
        ? BorderRadius.circular(100.0)
        : widget.cupertinoBorderRadius ??
            widget.borderRadius ??
            BorderRadius.circular(9.0);
    return GestureDetector(
      onLongPress: widget.onLongPress,
      onTapDown: _onTapDown,
      onTapCancel: _onTapCancel,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: kBorderRadius,
          border: Border.all(
            color: isPressed
                ? widget.kBorderColor.withOpacity(0.3)
                : widget.kBorderColor,
          ),
        ),
        child: CupertinoButton(
          onPressed: widget.onPressed,
          padding: widget.cupertinoPadding,
          minSize: widget.cupertinoMinSize ?? kMinInteractiveDimensionCupertino,
          alignment: widget.cupertinoAlignment,
          pressedOpacity: widget.cupertinoPressedOpacity,
          disabledColor: widget.cupertinoDisabledColor ??
              CupertinoColors.quaternarySystemFill,
          borderRadius: kBorderRadius,
          child: widget.icon == null
              ? widget.child
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.icon!,
                    const SizedBox(width: 8),
                    widget.child,
                  ],
                ),
        ),
      ),
    );
  }

  void _onTapDown(_) {
    isPressed = true;
    if (mounted) {
      setState(() {});
    }
  }

  void _onTapCancel() {
    isPressed = false;
    if (mounted) {
      setState(() {});
    }
  }
}
