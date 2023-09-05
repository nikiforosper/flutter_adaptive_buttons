import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_buttons/flutter_adaptive_buttons.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AdaptiveElevatedButton material rendering',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: AdaptiveElevatedButton(
              child: const Text('Button'),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );

    // Verify that the AdaptiveElevatedButton is rendered
    expect(find.text('Button'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('AdaptiveElevatedButton cupertino rendering',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      CupertinoApp(
        home: CupertinoPageScaffold(
          child: Center(
            child: AdaptiveElevatedButton(
              onlyCupertino: true,
              onPressed: () {},
              child: const Text('Button'),
            ),
          ),
        ),
      ),
    );

    // Verify that the AdaptiveElevatedButton is rendered
    expect(find.text('Button'), findsOneWidget);
    expect(find.byType(CupertinoButton), findsOneWidget);
  });

  testWidgets('AdaptiveTextButton material rendering',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: AdaptiveTextButton(
              child: const Text('Button'),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );

    // Verify that the AdaptiveTextButton is rendered
    expect(find.text('Button'), findsOneWidget);
    expect(find.byType(TextButton), findsOneWidget);
  });

  testWidgets('AdaptiveTextButton cupertino rendering',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      CupertinoApp(
        home: CupertinoPageScaffold(
          child: Center(
            child: AdaptiveTextButton(
              onlyCupertino: true,
              child: const Text('Button'),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );

    // Verify that the AdaptiveTextButton is rendered
    expect(find.text('Button'), findsOneWidget);
    expect(find.byType(CupertinoButton), findsOneWidget);
  });
  testWidgets('AdaptiveOutlinedButton material rendering',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: AdaptiveOutlinedButton(
              child: const Text('Button'),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );

    // Verify that the AdaptiveOutlinedButton is rendered
    expect(find.text('Button'), findsOneWidget);
    expect(find.byType(OutlinedButton), findsOneWidget);
  });

  testWidgets('AdaptiveOutlinedButton cupertino rendering',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      CupertinoApp(
        home: CupertinoPageScaffold(
          child: Center(
            child: AdaptiveOutlinedButton(
              onlyCupertino: true,
              child: const Text('Button'),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );

    // Verify that the AdaptiveOutlinedButton is rendered
    expect(find.text('Button'), findsOneWidget);
    expect(find.byType(CupertinoButton), findsOneWidget);
  });
  testWidgets('AdaptiveIconButton material rendering',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: AdaptiveIconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );

    // Verify that the AdaptiveIconButton is rendered as IconButton
    expect(find.byType(IconButton), findsOneWidget);
  });

  testWidgets('AdaptiveIconButton cupertino rendering',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      CupertinoApp(
        home: CupertinoPageScaffold(
          child: Center(
            child: AdaptiveIconButton(
              onlyCupertino: true,
              icon: const Icon(CupertinoIcons.add),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );

    // Verify that the AdaptiveIconButton is rendered as CupertinoButton
    expect(find.byType(CupertinoButton), findsOneWidget);
  });
}
