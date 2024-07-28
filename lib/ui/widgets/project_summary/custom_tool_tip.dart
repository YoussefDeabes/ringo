import 'package:flutter/material.dart';
import 'package:ringo/res/const_colors.dart';

class CustomTooltip extends StatelessWidget {
  final String value;

  const CustomTooltip({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TooltipPainter(value),
    );
  }
}

class TooltipPainter extends CustomPainter {
  final String value;

  TooltipPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ConstColors.app
      ..style = PaintingStyle.fill;

    final path = Path();
    const tooltipWidth = 65.0;
    const tooltipHeight = 35.0;
    const notchHeight = 8.0;
    const notchWidth = 22.0;
    const radius = 8.0;

    path.moveTo(radius, 0);
    path.lineTo(tooltipWidth - radius, 0);
    path.arcToPoint(
      const Offset(tooltipWidth, radius),
      radius: const Radius.circular(radius),
      clockwise: true,
    );
    path.lineTo(tooltipWidth, tooltipHeight - radius);
    path.arcToPoint(
      const Offset(tooltipWidth - radius, tooltipHeight),
      radius: const Radius.circular(radius),
      clockwise: true,
    );
    path.lineTo(tooltipWidth / 2 + notchWidth / 2, tooltipHeight);
    path.lineTo(tooltipWidth / 2, tooltipHeight + notchHeight);
    path.lineTo(tooltipWidth / 2 - notchWidth / 2, tooltipHeight);
    path.lineTo(radius, tooltipHeight);
    path.arcToPoint(
      const Offset(0, tooltipHeight - radius),
      radius: const Radius.circular(radius),
      clockwise: true,
    );
    path.lineTo(0, radius);
    path.arcToPoint(
      const Offset(radius, 0),
      radius: const Radius.circular(radius),
      clockwise: true,
    );

    canvas.drawPath(path, paint);

    final textPainter = TextPainter(
      text: TextSpan(
        text: value,
        style: const TextStyle(
            color: ConstColors.white,
            fontSize: 18,
            fontFamily: "Urbanist",
            fontWeight: FontWeight.w700),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: tooltipWidth - 2 * radius);
    textPainter.paint(
      canvas,
      Offset(
        (tooltipWidth - textPainter.width) / 2,
        (tooltipHeight - textPainter.height) / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
