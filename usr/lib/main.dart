import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/basic_analysis_screen.dart';
import 'screens/advanced_analysis_screen.dart';
import 'screens/goals_analysis_screen.dart';
import 'screens/trading_analysis_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Analisi Partite Calcio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/basic-analysis': (context) => const BasicAnalysisScreen(),
        '/advanced-analysis': (context) => const AdvancedAnalysisScreen(),
        '/goals-analysis': (context) => const GoalsAnalysisScreen(),
        '/trading-analysis': (context) => const TradingAnalysisScreen(),
      },
    );
  }
}