import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ═══════════════════════════════
  // 🖤 BACKGROUNDS
  // ═══════════════════════════════
  static const Color voidBlack    = Color(0xFF07070F);
  static const Color deepRoyal    = Color(0xFF0D0D20);
  static const Color midnightBlue = Color(0xFF1A1A2E);

  // ═══════════════════════════════
  // 👑 GOLD — اللون الملكي
  // ═══════════════════════════════
  static const Color imperialGold = Color(0xFFC8A951);
  static const Color softGold     = Color(0xFFE5C97A);
  static const Color champagne    = Color(0xFFFFF0BC);

  // ═══════════════════════════════
  // 💜 ROYAL PURPLE
  // ═══════════════════════════════
  static const Color royalPurple  = Color(0xFF7C3AED);
  static const Color lavender     = Color(0xFFA78BFA);

  // ═══════════════════════════════
  // ⚪ TEXT COLORS
  // ═══════════════════════════════
  static const Color pureWhite    = Color(0xFFF5F5FF);
  static const Color silverMist   = Color(0xFF8888A0);

  // ═══════════════════════════════
  // ✅ FEEDBACK COLORS
  // ═══════════════════════════════
  static const Color success      = Color(0xFF10B981);
  static const Color error        = Color(0xFFEF4444);
  static const Color warning      = Color(0xFFF59E0B);

  // ═══════════════════════════════
  // 🎨 GRADIENTS
  // ═══════════════════════════════
  static const LinearGradient goldGradient = LinearGradient(
    colors: [imperialGold, softGold, champagne],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient royalGradient = LinearGradient(
    colors: [voidBlack, deepRoyal],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}