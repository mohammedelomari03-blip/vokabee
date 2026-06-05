// lib/0_core/1_constants/design_system/vokabee_logo.dart
import 'package:flutter/material.dart';
import 'colors.dart';

class VokabeeLogo extends StatelessWidget {
  final double size;
  const VokabeeLogo({super.key, this.size = 120});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _LogoPainter(),
      ),
    );
  }
}

class _LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // ─── V Shape ─────────────────────────────────────────────
    final vPaint = Paint()
      ..color = AppColors.pureWhite
      ..style = PaintingStyle.fill;

    final vPath = Path()
      ..moveTo(w * 0.05, h * 0.05)
      ..lineTo(w * 0.25, h * 0.05)
      ..lineTo(w * 0.5, h * 0.65)
      ..lineTo(w * 0.75, h * 0.05)
      ..lineTo(w * 0.95, h * 0.05)
      ..lineTo(w * 0.5, h * 0.95)
      ..close();

    canvas.drawPath(vPath, vPaint);

    // ─── Bee Body ────────────────────────────────────────────
    final bodyPaint = Paint()
      ..color = AppColors.imperialGold
      ..style = PaintingStyle.fill;

    // Body oval
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(w * 0.5, h * 0.48),
        width: w * 0.22,
        height: h * 0.32,
      ),
      bodyPaint,
    );

    // Stripes
    final stripePaint = Paint()
      ..color = AppColors.voidBlack
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromLTWH(w * 0.39, h * 0.44, w * 0.22, h * 0.05),
      stripePaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(w * 0.39, h * 0.52, w * 0.22, h * 0.05),
      stripePaint,
    );

    // Head
    final headPaint = Paint()
      ..color = AppColors.voidBlack
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(w * 0.5, h * 0.30),
      w * 0.07,
      headPaint,
    );

    // Wings
    final wingPaint = Paint()
      ..color = AppColors.softGold.withValues(alpha: 0.7)
      ..style = PaintingStyle.fill;

    // Left wing
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(w * 0.34, h * 0.35),
        width: w * 0.18,
        height: h * 0.12,
      ),
      wingPaint,
    );

    // Right wing
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(w * 0.66, h * 0.35),
        width: w * 0.18,
        height: h * 0.12,
      ),
      wingPaint,
    );

    // Antennae
    final antennaPaint = Paint()
      ..color = AppColors.voidBlack
      ..strokeWidth = w * 0.02
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(w * 0.46, h * 0.24),
      Offset(w * 0.40, h * 0.15),
      antennaPaint,
    );
    canvas.drawLine(
      Offset(w * 0.54, h * 0.24),
      Offset(w * 0.60, h * 0.15),
      antennaPaint,
    );

    // Antenna tips
    final tipPaint = Paint()
      ..color = AppColors.imperialGold
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(w * 0.40, h * 0.14), w * 0.025, tipPaint);
    canvas.drawCircle(Offset(w * 0.60, h * 0.14), w * 0.025, tipPaint);

    // ─── Crown ───────────────────────────────────────────────
    final crownPaint = Paint()
      ..color = AppColors.imperialGold
      ..style = PaintingStyle.fill;

    final crownPath = Path()
      ..moveTo(w * 0.35, h * 0.12)
      ..lineTo(w * 0.35, h * 0.04)
      ..lineTo(w * 0.42, h * 0.09)
      ..lineTo(w * 0.5, h * 0.02)
      ..lineTo(w * 0.58, h * 0.09)
      ..lineTo(w * 0.65, h * 0.04)
      ..lineTo(w * 0.65, h * 0.12)
      ..close();

    canvas.drawPath(crownPath, crownPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}