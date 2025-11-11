import 'package:flutter/material.dart';

void main() => runApp(const ThemeSwitcherApp());

class ThemeSwitcherApp extends StatefulWidget {
  const ThemeSwitcherApp({super.key});

  @override
  State<ThemeSwitcherApp> createState() => _ThemeSwitcherAppState();
}

class _ThemeSwitcherAppState extends State<ThemeSwitcherApp> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: _isDark ? Colors.black : Colors.white,
        body: Center(
          child: GestureDetector(
            onTap: () => setState(() => _isDark = !_isDark),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              transitionBuilder: (child, anim) =>
                  RotationTransition(turns: anim, child: child),
              child: Icon(
                _isDark ? Icons.dark_mode : Icons.light_mode,
                key: ValueKey(_isDark),
                color: _isDark ? Colors.yellow : Colors.orange,
                size: 120,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
