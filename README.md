# flutter_adaptive_buttons

A collection of Flutter widgets that adapt their appearance based on the platform and provide consistent button functionalities across different platforms.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Demo](#demo)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

## Introduction

The flutter_adaptive_buttons package provides a set of widgets that adapt their appearance to the current platform. It enables you to create buttons that look and behave like native buttons on both Android and iOS platforms. The package includes different button types, such as ElevatedButton, TextButton, OutlinedButton, and IconButton, each with adaptive behavior and properties.

## Features

- Adaptive appearance: Widgets automatically adjust their visual style based on the platform (Android or iOS).
- Fine-grained control: Customize appearance and behavior for each platform separately.
- Material and Cupertino themes: Use the native look or override with custom themes if needed.

## Installation

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_adaptive_buttons: ^0.0.1
```
Or run this command with Flutter:
```bash
flutter pub add flutter_adaptive_buttons
```

Then, import the package:

```dart
import 'package:flutter_adaptive_buttons/flutter_adaptive_buttons.dart';
```

## Usage

The package provides several adaptive button widgets that you can use in your Flutter applications:

- `AdaptiveElevatedButton`: An elevated button with adaptive appearance.
- `AdaptiveTextButton`: A text button with adaptive appearance.
- `AdaptiveOutlinedButton`: An outlined button with adaptive appearance.
- `AdaptiveIconButton`: An icon button with adaptive appearance.

Also you can use the following widget to create adaptive buttons with icons.
- `AdaptiveElevatedButton.icon`: An elevated button with an icon and adaptive appearance.
- `AdaptiveTextButton.icon`: A text button with an icon and adaptive appearance.
- `AdaptiveOutlinedButton.icon`: An outlined button with an icon and adaptive appearance.
- `AdaptiveIconButton.icon`: An icon button with an icon and adaptive appearance.

Each widget adapts its appearance to the current platform (Android or iOS) and provides properties to customize its behavior for each platform individually.

## Demo

Check out the [demo](https://nikiforosper.github.io/adaptive_buttons_demo/#/) to see the Adaptive Buttons Widgets package in action.

## Examples

Here's a simple example of how to use the Adaptive Buttons:

AdaptiveElevatedButton
```dart
AdaptiveElevatedButton(
  onPressed: () {},
  child: const Text("ElevatedButton"),
),
AdaptiveElevatedButton.icon(
  onPressed: () {},
  icon: const Icon(Icons.notifications),
  child: const Text("AdaptiveElevatedButton.icon"),
)
```
AdaptiveTextButton

```dart
AdaptiveTextButton(
  onPressed: () {},
  child: const Text("AdaptiveTextButton"),
),
AdaptiveTextButton.icon(
  onPressed: () {},
  icon: const Icon(Icons.notifications),
  child: const Text("AdaptiveTextButton.icon"),
)
```
AdaptiveOutlinedButton

```dart
AdaptiveOutlinedButton(
  onPressed: () {},
  child: const Text("AdaptiveOutlinedButton"),
),
AdaptiveOutlinedButton.icon(
  onPressed: () {},
  icon: const Icon(Icons.notifications),
  child: const Text("AdaptiveOutlinedButton.icon"),
)
```

Check out the [example folder](example/) in this repository for more advanced usage scenarios and use cases for each adaptive button type.

## Contributing

Contributions are welcome! If you find a bug or have an idea for an enhancement, feel free to open an issue or submit a pull request on GitHub.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.