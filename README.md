# 🔮 Flat 3d Button

[![pub package](https://img.shields.io/pub/v/flat_3d_button.svg)](https://pub.dartlang.org/packages/flat_3d_button)

<p align="center">
  <img src="https://github.com/rijfas/flat_3d_button/raw/main/images/banner.png">
</p>

A simple 3D flat button with click animation!

## 🔩 Installation

```yaml
dependencies:
  flat_3d_button: ^1.0.3
```

## 🚚 Import

```dart
import 'package:flat_3d_button/flat_3d_button.dart';
```

## 🚀 Usage Examples

#### 1. Counter app using flat 3D buttons:

<p align="center">
  <img src="https://github.com/rijfas/flat_3d_button/raw/main/images/flat_3d_button_counter.GIF" height="100" align="center">
</p>
<br>

```dart
  Flat3dButton.icon(
    color: Colors.red,
    onPressed: _decrementCounter,
    icon: Icons.remove,
  ),
  const SizedBox(width: 10),
  Flat3dButton.text(
    onPressed: _resetCounter,
    text: 'reset',
  ),
  const SizedBox(width: 10),
  Flat3dButton.icon(
    color: Colors.green,
    onPressed: _incrementCounter,
    icon: Icons.add,
  ),
```

refer to the `main.dart` in the example for complete source code.

#### 2. Flat 3D button with text:

<p align="center">
  <img src="https://github.com/rijfas/flat_3d_button/raw/main/images/flat_3d_button_text.GIF" height="100" align="center">
</p>
<br>

```dart
Flat3dButton.text(
  onPressed: () => print('clicked'),
  text: 'Flat',
);
```

#### 3. Flat 3D button with icon:

<p align="center">
  <img src="https://github.com/rijfas/flat_3d_button/raw/main/images/flat_3d_button_icon.GIF" height="100" align="center">
</p>
<br>

```dart
Flat3dButton.icon(
  onPressed: () => print('clicked'),
  icon: Icons.rocket,
);
```

<br>

## 🔧 Author

<a href="https://rijfas.me" target="_blank"><img src="https://avatars.githubusercontent.com/u/67458012?s=40&v=4"></a>
<br>

## 📃 License

MIT License
