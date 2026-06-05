// lib/4_features/auth/presentation/pages/register_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../0_core/1_constants/design_system/colors.dart';
import '../../../../0_core/1_constants/design_system/typography.dart';
import '../../../../0_core/1_constants/design_system/spacing.dart';
import '../../../../0_core/1_constants/design_system/shadows.dart';
import '../../../../3_presentation/3_widgets/royal/royal_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() => _isLoading = false);
    context.go('/home');
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenH,
              vertical: AppSpacing.screenV,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ─── Back Button ──────────────────────────────────
                IconButton(
                  onPressed: () => context.go('/login'),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.pureWhite,
                  ),
                ),

                const SizedBox(height: AppSpacing.xl),

                // ─── Logo ─────────────────────────────────────────
                Center(
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [AppColors.imperialGold, AppColors.softGold],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: AppShadows.goldGlow,
                    ),
                    child: const Center(
                      child: Text('🐝', style: TextStyle(fontSize: 32)),
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.xl),

                // ─── Title ────────────────────────────────────────
                Center(
                  child: Text(
                    'إنشاء حساب جديد 👑',
                    style: AppTypography.headlineMedium.copyWith(
                      color: AppColors.pureWhite,
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.sm),

                Center(
                  child: Text(
                    'ابدأ رحلتك الملكية في تعلم الألمانية',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.silverMist,
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.xxxl),

                // ─── Name ─────────────────────────────────────────
                Text(
                  'الاسم الكامل',
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.pureWhite,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: _nameController,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.pureWhite,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'اسمك الكامل',
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: AppColors.silverMist,
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.lg),

                // ─── Email ────────────────────────────────────────
                Text(
                  'البريد الإلكتروني',
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.pureWhite,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.pureWhite,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'your@email.com',
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColors.silverMist,
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.lg),

                // ─── Password ─────────────────────────────────────
                Text(
                  'كلمة المرور',
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.pureWhite,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.pureWhite,
                  ),
                  decoration: InputDecoration(
                    hintText: '••••••••',
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: AppColors.silverMist,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.silverMist,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.lg),

                // ─── Confirm Password ─────────────────────────────
                Text(
                  'تأكيد كلمة المرور',
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.pureWhite,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirm,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.pureWhite,
                  ),
                  decoration: InputDecoration(
                    hintText: '••••••••',
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: AppColors.silverMist,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() => _obscureConfirm = !_obscureConfirm);
                      },
                      icon: Icon(
                        _obscureConfirm
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.silverMist,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.xxl),

                // ─── Register Button ──────────────────────────────
                RoyalButton(
                  label: 'إنشاء الحساب',
                  isLoading: _isLoading,
                  onPressed: _register,
                ),

                const SizedBox(height: AppSpacing.xl),

                // ─── Divider ──────────────────────────────────────
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.silverMist.withValues(alpha: 0.3),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                      ),
                      child: Text(
                        'أو',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.silverMist,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.silverMist.withValues(alpha: 0.3),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.xl),

                // ─── Google Button ────────────────────────────────
                RoyalButton(
                  label: 'المتابعة بـ Google',
                  type: RoyalButtonType.secondary,
                  icon: Icons.g_mobiledata,
                  onPressed: () {},
                ),

                const SizedBox(height: AppSpacing.xxxl),

                // ─── Login Link ───────────────────────────────────
                Center(
                  child: TextButton(
                    onPressed: () => context.go('/login'),
                    child: RichText(
                      text: TextSpan(
                        text: 'لديك حساب بالفعل؟ ',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.silverMist,
                        ),
                        children: [
                          TextSpan(
                            text: 'تسجيل الدخول',
                            style: AppTypography.labelSmall.copyWith(
                              color: AppColors.imperialGold,
                            ),
                          ),
                        ],
                      ),
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
}