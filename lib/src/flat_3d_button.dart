import 'package:flutter/material.dart';

/// Creates a simple flat 3d button with a click animation.
class Flat3dButton extends StatefulWidget {
  const Flat3dButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.color,
    this.padding = const EdgeInsets.symmetric(horizontal: 14.0, vertical: 7.0),
    this.elevation = 5.0,
    this.clickDuration = const Duration(milliseconds: 150),
    this.mouseCursor = SystemMouseCursors.click,
  }) : super(key: key);

  /// Callback to execute when the flat button is pressed.
  final void Function() onPressed;

  /// Padding elements inside the flat button.
  ///
  /// Defaults to 7.0 vertically and 14.0 horizontally
  final EdgeInsetsGeometry padding;

  /// Color of the flat button, bottom color is derived from the given color as the shade700
  ///
  /// Defaults to the current [Theme.of(context).colorScheme.primary] color.
  final MaterialColor? color;

  /// Elevation for the flat button.
  ///
  /// Defaults to 5.0
  final double elevation;

  /// The duration to animate the click.
  ///
  /// Defaults to 150 milliseconds.
  final Duration clickDuration;

  /// The cursor for a mouse pointer when it enters or is hovering over the flat button.
  ///
  /// Defaults to [SystemMouseCursors.click]
  final MouseCursor mouseCursor;

  /// The button's label.
  ///
  /// Often a [Text] widget or [Icon] widget.
  final Widget child;

  /// Flat 3D button with an [Icon] as it's label with the given [icon]
  ///
  /// The icon is padded by horizontally 2.5 logical pixels and vertically 5 logical pixels.
  /// The icon has a default color of white.
  factory Flat3dButton.icon({
    Key? key,
    required void Function() onPressed,
    required IconData icon,
    MaterialColor? color,
    EdgeInsets padding,
    double elevation,
    Duration clickDuration,
    MouseCursor mouseCursor,
    Color iconColor,
  }) = _Flat3dIconButton;

  /// Create a simple flat 3D button with a [Text] as it's label with the given [text] content.
  ///
  /// The text is padded by horizontally 14 logical pixels and vertically 7 logical pixels.
  /// The text has a default color of white.
  factory Flat3dButton.text({
    Key? key,
    required void Function() onPressed,
    required String text,
    MaterialColor? color,
    EdgeInsets padding,
    double elevation,
    Duration clickDuration,
    MouseCursor mouseCursor,
    Color textColor,
  }) = _Flat3dTextButton;

  @override
  State<Flat3dButton> createState() => _Flat3dButtonState();
}

class _Flat3dButtonState extends State<Flat3dButton> {
  late double _elevation;
  @override
  void initState() {
    _elevation = widget.elevation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MaterialColor color = widget.color ??
        (Theme.of(context).colorScheme.primary as MaterialColor);
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: (_) {
        setState(() {
          _elevation = 0;
        });
      },
      onTapUp: (_) {
        setState(() {
          _elevation = widget.elevation;
        });
      },
      child: MouseRegion(
        cursor: widget.mouseCursor,
        child: AnimatedContainer(
          margin: EdgeInsets.only(top: widget.elevation - _elevation),
          duration: widget.clickDuration,
          decoration: BoxDecoration(
            color: color,
            border: Border(
              bottom: BorderSide(
                color: color.shade700,
                width: _elevation,
              ),
            ),
          ),
          padding: widget.padding,
          child: widget.child,
        ),
      ),
    );
  }
}

class _Flat3dIconButton extends Flat3dButton {
  _Flat3dIconButton({
    Key? key,
    required void Function() onPressed,
    required IconData icon,
    EdgeInsets padding =
        const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
    MaterialColor? color,
    double elevation = 5.0,
    Duration clickDuration = const Duration(milliseconds: 150),
    MouseCursor mouseCursor = SystemMouseCursors.click,
    Color iconColor = Colors.white,
  }) : super(
          key: key,
          onPressed: onPressed,
          color: color,
          clickDuration: clickDuration,
          elevation: elevation,
          mouseCursor: mouseCursor,
          padding: padding,
          child: Icon(
            icon,
            color: iconColor,
          ),
        );
}

class _Flat3dTextButton extends Flat3dButton {
  _Flat3dTextButton({
    Key? key,
    required void Function() onPressed,
    required String text,
    MaterialColor? color,
    EdgeInsets padding =
        const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
    double elevation = 5.0,
    Duration clickDuration = const Duration(milliseconds: 150),
    MouseCursor mouseCursor = SystemMouseCursors.click,
    Color textColor = Colors.white,
  }) : super(
          key: key,
          onPressed: onPressed,
          color: color,
          clickDuration: clickDuration,
          elevation: elevation,
          mouseCursor: mouseCursor,
          padding: padding,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        );
}
