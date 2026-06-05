// lib/4_features/auth/presentation/pages/login_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../0_core/1_constants/design_system/colors.dart';
import '../../../../0_core/1_constants/design_system/typography.dart';
import '../../../../0_core/1_constants/design_system/spacing.dart';
import '../../../../0_core/1_constants/design_system/shadows.dart';
import '../../../../3_presentation/3_widgets/royal/royal_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
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
                // ─── Back Button ─────────────────────────────────────
                IconButton(
                  onPressed: () => context.go('/onboarding'),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.pureWhite,
                  ),
                ),

                const SizedBox(height: AppSpacing.xl),

                // ─── Logo ────────────────────────────────────────────
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

                // ─── Title ───────────────────────────────────────────
                Center(
                  child: Text(
                    'Welcome Back',
                    style: AppTypography.headlineMedium.copyWith(
                      color: AppColors.pureWhite,
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.sm),

                Center(
                  child: Text(
                    'Continue your learning journey',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.silverMist,
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.xxxl),

                // ─── Email ───────────────────────────────────────────
                Text(
                  'Email',
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
                  decoration: InputDecoration(
                    hintText: 'your@email.com',
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: AppColors.silverMist,
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.lg),

                // ─── Password ────────────────────────────────────────
                Text(
                  'Password',
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

                const SizedBox(height: AppSpacing.sm),

                // ─── Forgot Password ─────────────────────────────────
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.imperialGold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.xl),

                // ─── Login Button ────────────────────────────────────
                RoyalButton(
                  label: 'Log In',
                  isLoading: _isLoading,
                  onPressed: _login,
                ),

                const SizedBox(height: AppSpacing.xl),

                // ─── Divider ─────────────────────────────────────────
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
                        'or',
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

                // ─── Google Button ───────────────────────────────────
                RoyalButton(
                  label: 'Continue with Google',
                  type: RoyalButtonType.secondary,
                  icon: Icons.g_mobiledata,
                  onPressed: () {},
                ),

                const SizedBox(height: AppSpacing.xxxl),

                // ─── Register Link ───────────────────────────────────
                Center(
                  child: TextButton(
                    onPressed: () => context.go('/register'),
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.silverMist,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: AppTypography.labelSmall.copyWith(
                              color: AppColors.imperialGold,
                            ),
                          ),
                        ],
                      ),
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