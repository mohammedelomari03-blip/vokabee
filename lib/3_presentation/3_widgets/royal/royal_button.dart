import 'package:flutter/material.dart';
import '../../../0_core/1_constants/design_system/colors.dart';
import '../../../0_core/1_constants/design_system/typography.dart';
import '../../../0_core/1_constants/design_system/spacing.dart';
import '../../../0_core/1_constants/design_system/shadows.dart';
import '../../../0_core/1_constants/design_system/animations.dart';

enum RoyalButtonType { primary, secondary, ghost }

class RoyalButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final RoyalButtonType type;
  final bool isLoading;
  final IconData? icon;
  final double? width;

  const RoyalButton({
    super.key,
    required this.label,
    this.onPressed,
    this.type = RoyalButtonType.primary,
    this.isLoading = false,
    this.icon,
    this.width,
  });

  @override
  State<RoyalButton> createState() => _RoyalButtonState();
}

class _RoyalButtonState extends State<RoyalButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppAnimations.fast,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: AppAnimations.curveSmooth),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onPressed?.call();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: widget.width ?? double.infinity,
          height: AppSpacing.buttonHeight,
          decoration: _getDecoration(),
          child: Center(
            child: widget.isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: AppColors.voidBlack,
                      strokeWidth: 2,
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.icon != null) ...[
                        Icon(
                          widget.icon,
                          color: _getTextColor(),
                          size: AppSpacing.iconMd,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                      ],
                      Text(
                        widget.label,
                        style: AppTypography.labelLarge.copyWith(
                          color: _getTextColor(),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _getDecoration() {
    switch (widget.type) {
      case RoyalButtonType.primary:
        return BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.imperialGold, AppColors.softGold],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          boxShadow: AppShadows.buttonShadow,
        );
      case RoyalButtonType.secondary:
        return BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          border: Border.all(
            color: AppColors.imperialGold,
            width: 1.5,
          ),
        );
      case RoyalButtonType.ghost:
        return BoxDecoration(
          color: AppColors.deepRoyal,
          borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
        );
    }
  }

  Color _getTextColor() {
    switch (widget.type) {
      case RoyalButtonType.primary:
        return AppColors.voidBlack;
      case RoyalButtonType.secondary:
        return AppColors.imperialGold;
      case RoyalButtonType.ghost:
        return AppColors.pureWhite;
    }
  }
}