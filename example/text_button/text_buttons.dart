import 'package:flutter/material.dart';
import 'package:flutter_adaptive_buttons/flutter_adaptive_buttons.dart';

class TextButtons extends StatelessWidget {
  const TextButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            "Text Buttons",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Wrap(
          runSpacing: 16.0,
          spacing: 16.0,
          children: [
            AdaptiveTextButton(
              onlyMaterial: true,
              onPressed: () {},
              child: const Text("Material TextButton"),
            ),
            AdaptiveTextButton(
              onlyCupertino: true,
              onPressed: () {},
              child: const Text("Cupertino TextButton"),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          runSpacing: 16.0,
          spacing: 16.0,
          children: [
            AdaptiveTextButton.icon(
              onlyMaterial: true,
              onPressed: () {},
              icon: const Icon(Icons.notifications),
              child: const Text("Material TextButton.icon"),
            ),
            AdaptiveTextButton.icon(
              onlyCupertino: true,
              onPressed: () {},
              icon: const Icon(Icons.notifications),
              child: const Text("Cupertino TextButton.icon"),
            ),
          ],
        ),
      ],
    );
  }
}
