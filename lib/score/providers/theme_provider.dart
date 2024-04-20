import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:net_play/main.dart';

import '../config/constants.dart';
import '../config/session.dart';


/// Notifier for managing dark theme state
class DarkThemeNotifier extends StateNotifier<bool> {
  DarkThemeNotifier() : super(true);

  /// Toggle the dark theme state
  void toggle() {
    state = !state;
  }

  /// Toggle the dark theme state based on the previous state saved in session
  void toggleAsBefore() async {
    final isDark = await Session.getBool(Constants.isDarkKey);
    if (isDark != null) {
      debugPrint("isDark pref >> $isDark");
      state = isDark;
    } else {
      Session.setBool(Constants.isDarkKey, state);
    }
  }
}

final isDarkThemeProvider = StateNotifierProvider<DarkThemeNotifier, bool>((ref) {
  return DarkThemeNotifier();
});
