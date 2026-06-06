// lib/4_features/onboarding/presentation/pages/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../0_core/1_constants/design_system/colors.dart';
import '../../../../0_core/1_constants/design_system/typography.dart';
import '../../../../0_core/1_constants/design_system/spacing.dart';
import '../../../../0_core/1_constants/design_system/animations.dart';
import '../../../../3_presentation/3_widgets/royal/royal_button.dart';
import '../widgets/onboarding_illustrations.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  final List<_OnboardingData> _pages = const [
    _OnboardingData(
      title: 'حكم اللغة الألمانية',
      subtitle: 'النحلة تجمع وتبني ولا تتوقف أبداً.\nأنت هنا لأنك مثلها.',
    ),
    _OnboardingData(
      title: 'ارتقِ في الرتب الملكية',
      subtitle: 'من Noble إلى Emperor —\nكل كلمة تتعلمها تقربك من العرش.',
    ),
    _OnboardingData(
      title: 'ابنِ إمبراطوريتك',
      subtitle: 'تحديات يومية، ذكاء اصطناعي شخصي،\nومجتمع ملكي ينتظرك.',
    ),
  ];

  final List<Widget> _illustrations = const [
    OnboardingLogoIllustration(),
    OnboardingCrownIllustration(),
    OnboardingFlameIllustration(),
  ];

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: AppAnimations.normal,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: AppAnimations.curveOut),
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: AppAnimations.normal,
        curve: AppAnimations.curveSmooth,
      );
    } else {
      context.go('/login');
    }
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
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              children: [
                // ─── Skip Button ──────────────────────────────────
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: TextButton(
                      onPressed: () => context.go('/login'),
                      child: Text(
                        'تجاوز',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.silverMist,
                        ),
                      ),
                    ),
                  ),
                ),

                // ─── Pages ───────────────────────────────────────
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      return _buildPage(_pages[index], _illustrations[index]);
                    },
                  ),
                ),

                // ─── Dots ─────────────────────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                    (index) => _buildDot(index),
                  ),
                ),

                const SizedBox(height: AppSpacing.xl),

                // ─── Button ───────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenH,
                  ),
                  child: RoyalButton(
                    label: _currentPage == _pages.length - 1
                        ? 'ابدأ رحلتك 👑'
                        : 'التالي',
                    onPressed: _nextPage,
                  ),
                ),

                const SizedBox(height: AppSpacing.xl),

                // ─── Login Link ───────────────────────────────────
                TextButton(
                  onPressed: () => context.go('/login'),
                  child: Text(
                    'لديك حساب بالفعل؟ تسجيل الدخول',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.silverMist,
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPage(_OnboardingData data, Widget illustration) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenH),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          illustration,
          const SizedBox(height: AppSpacing.xxl),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: AppTypography.headlineMedium.copyWith(
              color: AppColors.pureWhite,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            data.subtitle,
            textAlign: TextAlign.center,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.silverMist,
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    final isActive = index == _currentPage;
    return AnimatedContainer(
      duration: AppAnimations.fast,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.imperialGold
            : AppColors.silverMist.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
    );
  }
}

class _OnboardingData {
  final String title;
  final String subtitle;

  const _OnboardingData({
    required this.title,
    required this.subtitle,
  });
}