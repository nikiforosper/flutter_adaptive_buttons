import 'package:flutter_adaptive_buttons/flutter_adaptive_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helper/color_list_widget.dart';

Color cupertinoDefaultColor =
    ColorScheme.fromSeed(seedColor: Colors.deepPurple).primary;

class ElevatedButtons extends StatefulWidget {
  const ElevatedButtons({super.key});

  @override
  State<ElevatedButtons> createState() => _ElevatedButtonsState();
}

class _ElevatedButtonsState extends State<ElevatedButtons> {
  late TextEditingController borderRadiusController;
  late TextEditingController materialBorderRadiusController;
  late TextEditingController cupertinoBorderRadiusController;
  double? borderRadius;
  double? materialBorderRadius;
  double? cupertinoBorderRadius;

  Color? defaultColor;
  Color? materialColor;
  Color? cupertinoColor;

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
    return Row(
      children: [
        Column(
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
              defaultColor: defaultColor,
              onTap: (color) {
                if (defaultColor != color) {
                  defaultColor = color;
                } else {
                  defaultColor = null;
                }
                if (mounted) setState(() {});
              },
            ),
            const Divider(),
            const Text("Material Background color"),
            BackgroundColorWidgets(
              defaultColor: materialColor,
              onTap: (color) {
                defaultColor = null;
                if (materialColor != color) {
                  materialColor = color;
                } else {
                  materialColor = null;
                }
                if (mounted) setState(() {});
              },
            ),
            const Divider(),
            const Text("Cupertino Background color"),
            BackgroundColorWidgets(
              defaultColor: cupertinoColor,
              onTap: (color) {
                defaultColor = null;
                if (cupertinoColor != color) {
                  cupertinoColor = color;
                } else {
                  cupertinoColor = null;
                }
                if (mounted) setState(() {});
              },
            ),
          ],
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text("Elevated Buttons",
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              Wrap(
                runSpacing: 16.0,
                spacing: 16.0,
                children: [
                  AdaptiveElevatedButton(
                    onlyMaterial: true,
                    color: materialColor ?? defaultColor,
                    borderRadius: borderRadius != null
                        ? BorderRadius.circular(borderRadius!)
                        : null,
                    materialBorderRadius: materialBorderRadius != null
                        ? BorderRadius.circular(materialBorderRadius!)
                        : null,
                    onPressed: () {},
                    child: const Text("Material ElevatedButton"),
                  ),
                  AdaptiveElevatedButton(
                    onlyCupertino: true,
                    color:
                        cupertinoColor ?? defaultColor ?? cupertinoDefaultColor,
                    onPressed: () {},
                    borderRadius: borderRadius != null
                        ? BorderRadius.circular(borderRadius!)
                        : null,
                    cupertinoBorderRadius: cupertinoBorderRadius != null
                        ? BorderRadius.circular(cupertinoBorderRadius!)
                        : null,
                    cupertinoBoxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    cupertinoHasElevation: true,
                    child: const Text("Cupertino ElevatedButton"),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                runSpacing: 16.0,
                spacing: 16.0,
                children: [
                  AdaptiveElevatedButton.icon(
                    onlyMaterial: true,
                    onPressed: () {},
                    icon: const Icon(Icons.notifications),
                    child: const Text("Material ElevatedButton.icon"),
                  ),
                  AdaptiveElevatedButton.icon(
                    onlyCupertino: true,
                    onPressed: () {},
                    icon: const Icon(Icons.notifications),
                    color: cupertinoDefaultColor,
                    child: const Text("Cupertino ElevatedButton.icon"),
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
