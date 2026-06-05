// lib/4_features/splash/presentation/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../0_core/1_constants/design_system/colors.dart';
import '../../../0_core/1_constants/design_system/typography.dart';
import '../../../0_core/1_constants/design_system/animations.dart';
import '../../../0_core/1_constants/design_system/shadows.dart';
import '../../../0_core/1_constants/design_system/vokabee_logo.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _glowController;
  late AnimationController _textController;

  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;
  late Animation<double> _glowOpacity;
  late Animation<double> _textOpacity;
  late Animation<Offset> _textSlide;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _startSequence();
  }

  void _initAnimations() {
    _logoController = AnimationController(
      vsync: this,
      duration: AppAnimations.slow,
    );
    _logoScale = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: AppAnimations.curveElastic),
    );
    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: AppAnimations.curveOut),
    );

    _glowController = AnimationController(
      vsync: this,
      duration: AppAnimations.goldGlow,
    )..repeat(reverse: true);
    _glowOpacity = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: AppAnimations.curve),
    );

    _textController = AnimationController(
      vsync: this,
      duration: AppAnimations.normal,
    );
    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: AppAnimations.curveOut),
    );
    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _textController, curve: AppAnimations.curveSmooth),
    );
  }

  Future<void> _startSequence() async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;
    _logoController.forward();

    await Future.delayed(AppAnimations.slow);
    if (!mounted) return;
    _textController.forward();

    await Future.delayed(AppAnimations.celebration);
    if (!mounted) return;
    context.go('/onboarding');
  }

  @override
  void dispose() {
    _logoController.dispose();
    _glowController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.voidBlack,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.voidBlack, AppColors.deepRoyal],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ─── Logo ─────────────────────────────────────────
                AnimatedBuilder(
                  animation: _glowController,
                  builder: (context, child) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFC8A951)
                                .withValues(alpha: 0.3 * _glowOpacity.value),
                            blurRadius: 60,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: child,
                    );
                  },
                  child: FadeTransition(
                    opacity: _logoOpacity,
                    child: ScaleTransition(
                      scale: _logoScale,
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.deepRoyal,
                          boxShadow: AppShadows.goldGlow,
                        ),
                        child: const Center(
                          child: VokabeeLogo(size: 100),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // ─── Text ─────────────────────────────────────────
                FadeTransition(
                  opacity: _textOpacity,
                  child: SlideTransition(
                    position: _textSlide,
                    child: Column(
                      children: [
                        Text(
                          'VOKABEE',
                          style: AppTypography.headlineLarge.copyWith(
                            color: AppColors.imperialGold,
                            letterSpacing: 6,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Learn. Level Up. Conquer.',
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.silverMist,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}