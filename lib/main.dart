import 'package:flutter/material.dart';
import 'providers/fitness_provider.dart';
import 'screens/home_screen.dart';
import 'screens/exercise_library_screen.dart';
import 'screens/progress_screen.dart';

void main() => runApp(const FitTrackerApp());

class FitTrackerApp extends StatefulWidget {
  const FitTrackerApp({super.key});

  @override
  State<FitTrackerApp> createState() => _FitTrackerAppState();
}

class _FitTrackerAppState extends State<FitTrackerApp> {
  final _provider = FitnessProvider();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _provider.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitTracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white, foregroundColor: Colors.black87, elevation: 0, scrolledUnderElevation: 1),
        cardTheme: CardTheme(elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Colors.grey[200]!))),
      ),
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            HomeScreen(provider: _provider, onNavigate: (i) => setState(() => _currentIndex = i)),
            ExerciseLibraryScreen(provider: _provider),
            ProgressScreen(provider: _provider),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (i) => setState(() => _currentIndex = i),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.fitness_center_outlined), selectedIcon: Icon(Icons.fitness_center), label: 'Exercises'),
            NavigationDestination(icon: Icon(Icons.trending_up_outlined), selectedIcon: Icon(Icons.trending_up), label: 'Progress'),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() { _provider.dispose(); super.dispose(); }
}
