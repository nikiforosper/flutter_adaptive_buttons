import 'package:flutter/material.dart';

class BackgroundColorWidgets extends StatelessWidget {
  const BackgroundColorWidgets({
    Key? key,
    this.defaultColor,
    required this.onTap,
  }) : super(key: key);
  final Color? defaultColor;
  final ValueChanged<Color> onTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        Stack(
          children: [
            Container(
              color: Colors.red,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => onTap(Colors.red),
                  child: const SizedBox(width: 50, height: 50),
                ),
              ),
            ),
            if (defaultColor == Colors.red)
              const Positioned.fill(
                child: Icon(
                  Icons.check,
                ),
              ),
          ],
        ),
        Stack(
          children: [
            Container(
              color: Colors.blue,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => onTap(Colors.blue),
                  child: const SizedBox(width: 50, height: 50),
                ),
              ),
            ),
            if (defaultColor == Colors.blue)
              const Positioned.fill(
                child: Icon(
                  Icons.check,
                ),
              ),
          ],
        )
      ],
    );
  }
}
