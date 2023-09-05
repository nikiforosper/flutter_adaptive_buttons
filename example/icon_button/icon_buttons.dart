import 'package:flutter_adaptive_buttons/flutter_adaptive_buttons.dart';
import 'package:flutter/material.dart';

class IconButtons extends StatelessWidget {
  const IconButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            "Icon Buttons",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Wrap(
          runSpacing: 16.0,
          spacing: 16.0,
          children: [
            Tooltip(
              message: "Material",
              child: AdaptiveIconButton(
                icon: const Icon(Icons.notifications),
                onlyMaterial: true,
                onPressed: () {},
              ),
            ),
            Tooltip(
              message: "Cupertino",
              child: AdaptiveIconButton(
                icon: const Icon(Icons.notifications),
                onlyCupertino: true,
                cupertinoDisabledColor: Colors.amber,
                onPressed: () {},
              ),
            ),
            Tooltip(
              message: "Cupertino with Material theme",
              child: AdaptiveIconButton(
                icon: const Icon(Icons.notifications),
                onlyCupertino: true,
                useMaterialThemeOnCupertino: true,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
