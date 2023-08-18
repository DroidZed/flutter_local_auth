import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {required this.content,
      this.color,
      this.onPress,
      this.elevation = 2,
      this.width = double.infinity,
      this.paddingH = 20,
      this.paddingV = 20,
      this.height = 50,
      super.key});

  final Widget content;
  final double paddingV;
  final double paddingH;
  final double? elevation;
  final double width;
  final double height;
  final Color? color;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
          (states) => const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
        ),
        maximumSize: MaterialStateProperty.all(Size.fromWidth(width)),
        minimumSize: MaterialStateProperty.all(Size(width, height)),
        elevation: MaterialStateProperty.all(elevation),
        backgroundColor: MaterialStateProperty.all<Color>(
          color ?? Theme.of(context).colorScheme.primary,
        ),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: paddingH,
            vertical: paddingV,
          ),
        ),
      ),
      child: content,
    );
  }
}
