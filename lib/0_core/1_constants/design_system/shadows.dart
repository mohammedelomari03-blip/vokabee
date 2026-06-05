import 'package:flutter/material.dart';

class AppShadows {
  AppShadows._();

  // ═══════════════════════════════
  // ✨ GOLD GLOW — التوهج الذهبي
  // ═══════════════════════════════
  static const List<BoxShadow> goldGlow = [
    BoxShadow(
      color: Color(0x40C8A951),
      blurRadius: 20,
      spreadRadius: 0,
      offset: Offset(0, 4),
    ),
    BoxShadow(
      color: Color(0x20C8A951),
      blurRadius: 40,
      spreadRadius: 0,
      offset: Offset(0, 8),
    ),
  ];

  // ═══════════════════════════════
  // 💜 PURPLE GLOW
  // ═══════════════════════════════
  static const List<BoxShadow> purpleGlow = [
    BoxShadow(
      color: Color(0x407C3AED),
      blurRadius: 20,
      spreadRadius: 0,
      offset: Offset(0, 4),
    ),
    BoxShadow(
      color: Color(0x207C3AED),
      blurRadius: 40,
      spreadRadius: 0,
      offset: Offset(0, 8),
    ),
  ];

  // ═══════════════════════════════
  // 🃏 CARD SHADOW
  // ═══════════════════════════════
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Color(0x60000000),
      blurRadius: 24,
      spreadRadius: 0,
      offset: Offset(0, 8),
    ),
  ];

  // ═══════════════════════════════
  // 👑 ROYAL BUTTON SHADOW
  // ═══════════════════════════════
  static const List<BoxShadow> buttonShadow = [
    BoxShadow(
      color: Color(0x50C8A951),
      blurRadius: 16,
      spreadRadius: 0,
      offset: Offset(0, 6),
    ),
  ];

  // ═══════════════════════════════
  // 🌟 ACHIEVEMENT GLOW
  // ═══════════════════════════════
  static const List<BoxShadow> achievementGlow = [
    BoxShadow(
      color: Color(0x60C8A951),
      blurRadius: 30,
      spreadRadius: 2,
      offset: Offset(0, 0),
    ),
  ];
}