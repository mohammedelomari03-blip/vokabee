// lib/4_features/onboarding/presentation/widgets/onboarding_illustrations.dart
import 'package:flutter/material.dart';
import '../../../../0_core/1_constants/design_system/colors.dart';
import '../../../../0_core/1_constants/design_system/vokabee_logo.dart';

// ─── Widget 1: لوغو VOKABEE مع Glow نابض ────────────────────────────────────
class OnboardingLogoIllustration extends StatefulWidget {
  const OnboardingLogoIllustration({super.key});

  @override
  State<OnboardingLogoIllustration> createState() =>
      _OnboardingLogoIllustrationState();
}

class _OnboardingLogoIllustrationState
    extends State<OnboardingLogoIllustration>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    _glowAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.deepRoyal,
            boxShadow: [
              BoxShadow(
                color: AppColors.imperialGold
                    .withValues(alpha: 0.4 * _glowAnimation.value),
                blurRadius: 40,
                spreadRadius: 8,
              ),
              BoxShadow(
                color: AppColors.imperialGold
                    .withValues(alpha: 0.2 * _glowAnimation.value),
                blurRadius: 80,
                spreadRadius: 16,
              ),
            ],
          ),
          child: const Center(
            child: VokabeeLogo(size: 100),
          ),
        );
      },
    );
  }
}

// ─── Widget 2: تاج ملكي ───────────────────────────────────────────────────────
class OnboardingCrownIllustration extends StatefulWidget {
  const OnboardingCrownIllustration({super.key});

  @override
  State<OnboardingCrownIllustration> createState() =>
      _OnboardingCrownIllustrationState();
}

class _OnboardingCrownIllustrationState
    extends State<OnboardingCrownIllustration>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _floatAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
    _floatAnimation = Tween<double>(begin: -6, end: 6).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _glowAnimation = Tween<double>(begin: 0.3, end: 0.8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatAnimation.value),
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.royalPurple.withValues(alpha: 0.15),
              border: Border.all(
                color: AppColors.royalPurple.withValues(alpha: 0.3),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.royalPurple
                      .withValues(alpha: 0.4 * _glowAnimation.value),
                  blurRadius: 40,
                  spreadRadius: 8,
                ),
              ],
            ),
            child: Center(
              child: CustomPaint(
                size: const Size(80, 80),
                painter: _CrownPainter(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CrownPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // ─── Crown Shadow ─────────────────────────────────────────
    final shadowPaint = Paint()
      ..color = AppColors.imperialGold.withValues(alpha: 0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    final shadowPath = Path()
      ..moveTo(w * 0.1, h * 0.75)
      ..lineTo(w * 0.1, h * 0.35)
      ..lineTo(w * 0.25, h * 0.55)
      ..lineTo(w * 0.5, h * 0.2)
      ..lineTo(w * 0.75, h * 0.55)
      ..lineTo(w * 0.9, h * 0.35)
      ..lineTo(w * 0.9, h * 0.75)
      ..close();

    canvas.drawPath(shadowPath, shadowPaint);

    // ─── Crown Body ───────────────────────────────────────────
    final gradient = LinearGradient(
      colors: [AppColors.imperialGold, AppColors.softGold, AppColors.champagne],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final crownPaint = Paint()
      ..shader = gradient.createShader(Rect.fromLTWH(0, 0, w, h))
      ..style = PaintingStyle.fill;

    final crownPath = Path()
      ..moveTo(w * 0.1, h * 0.75)
      ..lineTo(w * 0.1, h * 0.35)
      ..lineTo(w * 0.25, h * 0.55)
      ..lineTo(w * 0.5, h * 0.2)
      ..lineTo(w * 0.75, h * 0.55)
      ..lineTo(w * 0.9, h * 0.35)
      ..lineTo(w * 0.9, h * 0.75)
      ..close();

    canvas.drawPath(crownPath, crownPaint);

    // ─── Crown Base ───────────────────────────────────────────
    final basePaint = Paint()
      ..shader = gradient.createShader(Rect.fromLTWH(0, h * 0.7, w, h * 0.15))
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.08, h * 0.72, w * 0.84, h * 0.12),
        const Radius.circular(4),
      ),
      basePaint,
    );

    // ─── Gems ─────────────────────────────────────────────────
    final gemColors = [
      const Color(0xFFE74C3C), // أحمر
      const Color(0xFF3498DB), // أزرق
      const Color(0xFF2ECC71), // أخضر
    ];

    final gemPositions = [
      Offset(w * 0.5, h * 0.28),
      Offset(w * 0.2, h * 0.48),
      Offset(w * 0.8, h * 0.48),
    ];

    for (int i = 0; i < 3; i++) {
      final gemPaint = Paint()
        ..color = gemColors[i]
        ..style = PaintingStyle.fill;

      canvas.drawCircle(gemPositions[i], w * 0.055, gemPaint);

      final gemGlowPaint = Paint()
        ..color = gemColors[i].withValues(alpha: 0.4)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

      canvas.drawCircle(gemPositions[i], w * 0.07, gemGlowPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─── Widget 3: شعلة ذهبية ────────────────────────────────────────────────────
class OnboardingFlameIllustration extends StatefulWidget {
  const OnboardingFlameIllustration({super.key});

  @override
  State<OnboardingFlameIllustration> createState() =>
      _OnboardingFlameIllustrationState();
}

class _OnboardingFlameIllustrationState
    extends State<OnboardingFlameIllustration>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _glowAnimation = Tween<double>(begin: 0.3, end: 0.8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.imperialGold.withValues(alpha: 0.1),
              border: Border.all(
                color: AppColors.imperialGold.withValues(alpha: 0.3),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.imperialGold
                      .withValues(alpha: 0.4 * _glowAnimation.value),
                  blurRadius: 40,
                  spreadRadius: 8,
                ),
                BoxShadow(
                  color: const Color(0xFFFF6B00)
                      .withValues(alpha: 0.2 * _glowAnimation.value),
                  blurRadius: 60,
                  spreadRadius: 12,
                ),
              ],
            ),
            child: Center(
              child: CustomPaint(
                size: const Size(70, 80),
                painter: _FlamePainter(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _FlamePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // ─── Outer Flame ──────────────────────────────────────────
    final outerGradient = const LinearGradient(
      colors: [Color(0xFFFF6B00), AppColors.imperialGold, AppColors.softGold],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );

    final outerPaint = Paint()
      ..shader = outerGradient.createShader(Rect.fromLTWH(0, 0, w, h))
      ..style = PaintingStyle.fill;

    final outerFlame = Path()
      ..moveTo(w * 0.5, 0)
      ..cubicTo(w * 0.9, h * 0.2, w * 1.1, h * 0.5, w * 0.8, h * 0.75)
      ..cubicTo(w * 0.7, h * 0.95, w * 0.3, h * 0.95, w * 0.2, h * 0.75)
      ..cubicTo(-w * 0.1, h * 0.5, w * 0.1, h * 0.2, w * 0.5, 0)
      ..close();

    canvas.drawPath(outerFlame, outerPaint);

    // ─── Inner Flame ──────────────────────────────────────────
    final innerGradient = const LinearGradient(
      colors: [AppColors.champagne, AppColors.softGold],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );

    final innerPaint = Paint()
      ..shader = innerGradient.createShader(
          Rect.fromLTWH(w * 0.2, h * 0.3, w * 0.6, h * 0.6))
      ..style = PaintingStyle.fill;

    final innerFlame = Path()
      ..moveTo(w * 0.5, h * 0.25)
      ..cubicTo(w * 0.75, h * 0.4, w * 0.8, h * 0.6, w * 0.65, h * 0.78)
      ..cubicTo(w * 0.55, h * 0.9, w * 0.45, h * 0.9, w * 0.35, h * 0.78)
      ..cubicTo(w * 0.2, h * 0.6, w * 0.25, h * 0.4, w * 0.5, h * 0.25)
      ..close();

    canvas.drawPath(innerFlame, innerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}