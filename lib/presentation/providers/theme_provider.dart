import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

//  Inmutable List of colors
// Valores inmutables
final colorListProvider = Provider((ref) => colorList);

// Mantener una pieza en el estado
final selectedColorProvider = StateProvider((ref) => 0);

// Object AppTheme ( custom )

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

// Controller o notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());
  void toggleDarkMode() {
  
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }
}
