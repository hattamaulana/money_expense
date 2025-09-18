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
    this.borderRadius,
  }) : super(key: key);

  /// Callback to execute when the flat button is pressed.
  final void Function() onPressed;

  final BorderRadiusGeometry? borderRadius;

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
  /// Create a simple flat 3D button with a [Text] as it's label with the given [text] content.
  ///
  /// The text is padded by horizontally 14 logical pixels and vertically 7 logical pixels.
  /// The text has a default color of white.
  factory Flat3dButton.text({
    Key? key,
    required BuildContext context,
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
        child: ClipRRect(
          child: AnimatedContainer(
            margin: EdgeInsets.only(top: widget.elevation - _elevation),
            width: double.infinity,
            duration: widget.clickDuration,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0xFF2BBE98), Color(0xFF008764)],
              ),
              border: Border(
                bottom: BorderSide(
                  color: const Color.fromARGB(60, 1, 47, 23),
                  width: _elevation > 0.0 ? _elevation : 0.1,
                ),
              ),
              // borderRadius: _elevation > 0.0 ? BorderRadius.circular(12) : null,
              borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
            ),
            padding: widget.padding,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class _Flat3dTextButton extends Flat3dButton {
  _Flat3dTextButton({
    Key? key,
    required BuildContext context,
    required void Function() onPressed,
    required String text,
    MaterialColor? color,
    EdgeInsets padding = const EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 12,
    ),
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
           style: Theme.of(context).textTheme.bodyLarge!.copyWith(
             color: Theme.of(context).colorScheme.surface,
             fontSize: 20,
             fontWeight: FontWeight.bold,
           ),
           textAlign: TextAlign.center,
         ),
       );
}
