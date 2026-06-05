import 'package:flutter/material.dart';
class AppAnimations {
  AppAnimations._();

  // ═══════════════════════════════
  // ⏱️ DURATIONS
  // ═══════════════════════════════
  static const Duration instant    = Duration(milliseconds: 100);
  static const Duration fast       = Duration(milliseconds: 200);
  static const Duration normal     = Duration(milliseconds: 300);
  static const Duration slow       = Duration(milliseconds: 500);
  static const Duration verySlow   = Duration(milliseconds: 800);
  static const Duration splash     = Duration(milliseconds: 1200);
  static const Duration pageTransit = Duration(milliseconds: 400);

  // ═══════════════════════════════
  // 🎯 CURVES
  // ═══════════════════════════════
  static const curve         = Curves.easeInOut;
  static const curveIn       = Curves.easeIn;
  static const curveOut      = Curves.easeOut;
  static const curveElastic  = Curves.elasticOut;
  static const curveBounce   = Curves.bounceOut;
  static const curveSmooth   = Curves.fastOutSlowIn;

  // ═══════════════════════════════
  // 👑 ROYAL SPECIFIC
  // ═══════════════════════════════
  static const Duration goldGlow     = Duration(milliseconds: 1500);
  static const Duration rankUp       = Duration(milliseconds: 2000);
  static const Duration streakFire   = Duration(milliseconds: 800);
  static const Duration xpCounter    = Duration(milliseconds: 1000);
  static const Duration celebration  = Duration(milliseconds: 3000);
}