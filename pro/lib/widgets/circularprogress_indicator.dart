import 'package:flutter/material.dart';
import 'package:pro/widgets/sizedbox_widget.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  const CircularProgressIndicatorWidget(
      {super.key,
      this.context,
      this.size = 10,
      this.strokeWidth = 2,
      this.color,
      this.alignment});
  final BuildContext? context;
  final double size;
  final double strokeWidth;
  final Color? color;
  final AlignmentGeometry? alignment;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: SizedBoxWidget(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          valueColor: AlwaysStoppedAnimation<Color>(
              color ?? Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
