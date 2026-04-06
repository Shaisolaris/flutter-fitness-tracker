class DemoFitness {
  static final Map<String, dynamic> today = {'steps': 8432, 'stepsGoal': 10000, 'calories': 1847, 'activeMinutes': 45, 'distance': 5.2};
  static final List<Map<String, dynamic>> workouts = [
    {'id': '1', 'type': 'Morning Run', 'duration': 32, 'calories': 320, 'date': '2026-04-05'},
    {'id': '2', 'type': 'Weight Training', 'duration': 45, 'calories': 280, 'date': '2026-04-04'},
    {'id': '3', 'type': 'Yoga', 'duration': 30, 'calories': 120, 'date': '2026-04-03'},
    {'id': '4', 'type': 'HIIT', 'duration': 25, 'calories': 350, 'date': '2026-04-02'},
  ];
  static final List<Map<String, int>> weeklySteps = [
    {'day': 1, 'steps': 9200}, {'day': 2, 'steps': 7800}, {'day': 3, 'steps': 11200},
    {'day': 4, 'steps': 6500}, {'day': 5, 'steps': 8432},
  ];
}
