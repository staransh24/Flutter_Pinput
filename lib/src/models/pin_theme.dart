part of '../pinput.dart';

/// Theme of the individual pin items for following states:
/// default, focused pin, submitted pin, following pin, disabled pin and error pin
class PinTheme {
  /// width of each [Pinput] field
  final double? width;

  /// height of each [Pinput] field
  final double? height;

  /// The style to use for PinPut
  /// If null, defaults to the `subhead` text style from the current [Theme].
  final TextStyle? textStyle;

  /// Empty space to surround the [Pinput] field container.
  final EdgeInsetsGeometry? margin;

  /// Empty space to inscribe the [Pinput] field container.
  /// For example space between border and text
  final EdgeInsetsGeometry? padding;

  /// Additional constraints to apply to the each field container.
  final BoxConstraints? constraints;

  /// ShapeDecoration for custom shapes like RoundedSuperellipseBorder
  /// You can customize every pixel with it
  /// Properties are being animated implicitly when value changes
  final ShapeDecoration? decoration;

  /// Theme of the individual pin items for following states:
  /// default, focused pin, submitted pin, following pin, disabled pin and error pin
  const PinTheme({
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.textStyle,
    this.decoration,
    this.constraints,
  });

  /// Merge two [PinTheme] into one
  PinTheme apply({required PinTheme theme}) {
    return PinTheme(
      width: this.width ?? theme.width,
      height: this.height ?? theme.height,
      textStyle: this.textStyle ?? theme.textStyle,
      constraints: this.constraints ?? theme.constraints,
      decoration: this.decoration ?? theme.decoration,
      padding: this.padding ?? theme.padding,
      margin: this.margin ?? theme.margin,
    );
  }

  /// Create a new [PinTheme] from the current instance
  PinTheme copyWith({
    double? width,
    double? height,
    TextStyle? textStyle,
    BoxConstraints? constraints,
    ShapeDecoration? decoration,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
  }) {
    return PinTheme(
      width: width ?? this.width,
      height: height ?? this.height,
      textStyle: textStyle ?? this.textStyle,
      constraints: constraints ?? this.constraints,
      decoration: decoration ?? this.decoration,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
    );
  }

  /// Helper method to create a new ShapeDecoration since it doesn't have copyWith
  ShapeDecoration _createShapeDecoration({
    Color? color,
    DecorationImage? image,
    Gradient? gradient,
    List<BoxShadow>? shadows,
    ShapeBorder? shape,
  }) {
    return ShapeDecoration(
      color: color ?? decoration?.color,
      image: image ?? decoration?.image,
      gradient: gradient ?? decoration?.gradient,
      shadows: shadows ?? decoration?.shadows,
      shape: shape ?? decoration?.shape ?? RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(0)),
    );
  }

  /// Create a new [PinTheme] from the current instance with new decoration properties
  PinTheme copyDecorationWith({
    Color? color,
    DecorationImage? image,
    Gradient? gradient,
    List<BoxShadow>? shadows,
    ShapeBorder? shape,
  }) {
    return copyWith(
      decoration: _createShapeDecoration(
        color: color,
        image: image,
        gradient: gradient,
        shadows: shadows,
        shape: shape,
      ),
    );
  }

  /// Create a new [PinTheme] with RoundedSuperellipseBorder
  PinTheme copyBorderWith({
    BorderSide? side,
    BorderRadiusGeometry? borderRadius,
  }) {
    final currentShape = decoration?.shape;
    ShapeBorder newShape;

    if (currentShape is RoundedSuperellipseBorder) {
      // Use the copyWith method of RoundedSuperellipseBorder
      newShape = currentShape.copyWith(
        side: side,
        borderRadius: borderRadius,
      );
    } else {
      // Create new RoundedSuperellipseBorder with safe defaults
      newShape = RoundedSuperellipseBorder(
        side: side ?? BorderSide.none,
        borderRadius: borderRadius ?? BorderRadius.circular(0),
      );
    }

    return copyDecorationWith(shape: newShape);
  }

  /// Convenience method to create PinTheme with RoundedSuperellipseBorder
  static PinTheme withSuperellipse({
    double? width,
    double? height,
    Color? color,
    BorderSide? side,
    BorderRadiusGeometry? borderRadius,
    TextStyle? textStyle,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    BoxConstraints? constraints,
    Gradient? gradient,
    List<BoxShadow>? shadows,
  }) {
    return PinTheme(
      width: width,
      height: height,
      textStyle: textStyle,
      margin: margin,
      padding: padding,
      constraints: constraints,
      decoration: ShapeDecoration(
        color: color,
        gradient: gradient,
        shadows: shadows,
        shape: RoundedSuperellipseBorder(
          side: side ?? BorderSide.none,
          borderRadius: borderRadius ?? BorderRadius.circular(0),
        ),
      ),
    );
  }
}