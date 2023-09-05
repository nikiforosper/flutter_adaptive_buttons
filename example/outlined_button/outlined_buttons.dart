import 'package:flutter_adaptive_buttons/flutter_adaptive_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helper/color_list_widget.dart';

class OutlinedButtons extends StatefulWidget {
  const OutlinedButtons({super.key});

  @override
  State<OutlinedButtons> createState() => _OutlinedButtonsState();
}

class _OutlinedButtonsState extends State<OutlinedButtons> {
  late TextEditingController borderRadiusController;
  late TextEditingController materialBorderRadiusController;
  late TextEditingController cupertinoBorderRadiusController;
  double? borderRadius;
  double? materialBorderRadius;
  double? cupertinoBorderRadius;
  Color? defaultBorderColor;
  Color? materialBorderColor;
  Color? cupertinoBorderColor;
  @override
  void initState() {
    super.initState();
    borderRadiusController = TextEditingController()
      ..addListener(() {
        if (borderRadiusController.text.isEmpty) {
          borderRadius = null;
        }
      });
    materialBorderRadiusController = TextEditingController()
      ..addListener(() {
        if (materialBorderRadiusController.text.isEmpty) {
          materialBorderRadius = null;
        }
      });
    cupertinoBorderRadiusController = TextEditingController()
      ..addListener(() {
        if (cupertinoBorderRadiusController.text.isEmpty) {
          cupertinoBorderRadius = null;
        }
      });

    borderRadius = double.tryParse(borderRadiusController.text);
    materialBorderRadius =
        double.tryParse(materialBorderRadiusController.text) ??
            double.tryParse(borderRadiusController.text);
    cupertinoBorderRadius =
        double.tryParse(cupertinoBorderRadiusController.text) ??
            double.tryParse(borderRadiusController.text);
    setState(() {});
  }

  @override
  void dispose() {
    borderRadiusController.dispose();
    materialBorderRadiusController.dispose();
    cupertinoBorderRadiusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color cupertinoDefaultColor =
        ColorScheme.fromSeed(seedColor: Colors.deepPurple).primary;
    return Row(
      children: [
        SizedBox(
            width: 200,
            child: Column(
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: borderRadiusController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      label: Text("Common BorderRadius"),
                    ),
                    onChanged: (value) {
                      borderRadius = double.tryParse(value);

                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: materialBorderRadiusController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      label: Text("Material BorderRadius"),
                    ),
                    onChanged: (value) {
                      materialBorderRadius = double.tryParse(value);
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: cupertinoBorderRadiusController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      label: Text("Cupertino BorderRadius"),
                    ),
                    onChanged: (value) {
                      cupertinoBorderRadius = double.tryParse(value);
                      setState(() {});
                    },
                  ),
                ),
                const Divider(),
                const Text("Background color"),
                BackgroundColorWidgets(
                  defaultColor: defaultBorderColor,
                  onTap: (color) {
                    if (defaultBorderColor != color) {
                      defaultBorderColor = color;
                    } else {
                      defaultBorderColor = null;
                    }
                    if (mounted) setState(() {});
                  },
                ),
                const Divider(),
                const Text("Material Background color"),
                BackgroundColorWidgets(
                  defaultColor: materialBorderColor,
                  onTap: (color) {
                    defaultBorderColor = null;
                    if (materialBorderColor != color) {
                      materialBorderColor = color;
                    } else {
                      materialBorderColor = null;
                    }
                    if (mounted) setState(() {});
                  },
                ),
                const Divider(),
                const Text("Cupertino Background color"),
                BackgroundColorWidgets(
                  defaultColor: cupertinoBorderColor,
                  onTap: (color) {
                    defaultBorderColor = null;
                    if (cupertinoBorderColor != color) {
                      cupertinoBorderColor = color;
                    } else {
                      cupertinoBorderColor = null;
                    }
                    if (mounted) setState(() {});
                  },
                ),
              ],
            )),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "Outlined Buttons",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Wrap(
                runSpacing: 16.0,
                spacing: 16.0,
                children: [
                  AdaptiveOutlinedButton(
                    onlyMaterial: true,
                    onPressed: () {},
                    borderColor: materialBorderColor ?? defaultBorderColor,
                    borderRadius: borderRadius != null
                        ? BorderRadius.circular(borderRadius!)
                        : null,
                    materialBorderRadius: materialBorderRadius != null
                        ? BorderRadius.circular(materialBorderRadius!)
                        : null,
                    child: const Text("Material OutlinedButton"),
                  ),
                  AdaptiveOutlinedButton(
                    onlyCupertino: true,
                    onPressed: () {},
                    borderColor: cupertinoBorderColor ??
                        defaultBorderColor ??
                        cupertinoDefaultColor,
                    borderRadius: borderRadius != null
                        ? BorderRadius.circular(borderRadius!)
                        : null,
                    cupertinoBorderRadius: cupertinoBorderRadius != null
                        ? BorderRadius.circular(cupertinoBorderRadius!)
                        : null,
                    cupertinoPadding: const EdgeInsets.symmetric(horizontal: 8),
                    child: const Text("Cupertino OutlinedButton"),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                runSpacing: 16.0,
                spacing: 16.0,
                children: [
                  AdaptiveOutlinedButton.icon(
                    onlyMaterial: true,
                    onPressed: () {},
                    borderColor: materialBorderColor ?? defaultBorderColor,
                    borderRadius: borderRadius != null
                        ? BorderRadius.circular(borderRadius!)
                        : null,
                    materialBorderRadius: materialBorderRadius != null
                        ? BorderRadius.circular(materialBorderRadius!)
                        : null,
                    icon: const Icon(Icons.notifications),
                    child: const Text("OutlinedButton Material.icon"),
                  ),
                  AdaptiveOutlinedButton.icon(
                    onlyCupertino: true,
                    onPressed: () {},
                    borderColor: cupertinoBorderColor ??
                        defaultBorderColor ??
                        cupertinoDefaultColor,
                    borderRadius: borderRadius != null
                        ? BorderRadius.circular(borderRadius!)
                        : null,
                    cupertinoBorderRadius: cupertinoBorderRadius != null
                        ? BorderRadius.circular(cupertinoBorderRadius!)
                        : null,
                    icon: const Icon(Icons.notifications),
                    child: const Text("OutlinedButton Cupertino.icon"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
