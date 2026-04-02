import 'package:flutter/foundation.dart';
import '../models/models.dart';

class FitnessProvider extends ChangeNotifier {
  // ─── Exercise Library ─────────────────────────────────
  final List<Exercise> exercises = const [
    Exercise(id: 'e1', name: 'Bench Press', muscleGroup: 'Chest', equipment: 'Barbell', difficulty: 'intermediate', instructions: 'Lie flat on bench, grip bar slightly wider than shoulders, lower to chest, press up.', emoji: '🏋️'),
    Exercise(id: 'e2', name: 'Squat', muscleGroup: 'Legs', equipment: 'Barbell', difficulty: 'intermediate', instructions: 'Bar on upper back, feet shoulder-width, sit back and down to parallel, drive up.', emoji: '🦵'),
    Exercise(id: 'e3', name: 'Deadlift', muscleGroup: 'Back', equipment: 'Barbell', difficulty: 'advanced', instructions: 'Stand over bar, hip-width grip, flat back, drive through heels to stand.', emoji: '💪'),
    Exercise(id: 'e4', name: 'Overhead Press', muscleGroup: 'Shoulders', equipment: 'Barbell', difficulty: 'intermediate', instructions: 'Bar at collarbone, grip shoulder-width, press overhead to lockout.', emoji: '🏋️'),
    Exercise(id: 'e5', name: 'Barbell Row', muscleGroup: 'Back', equipment: 'Barbell', difficulty: 'intermediate', instructions: 'Hinge at hips, pull bar to lower chest, squeeze shoulder blades.', emoji: '🚣'),
    Exercise(id: 'e6', name: 'Pull-ups', muscleGroup: 'Back', equipment: 'Bodyweight', difficulty: 'intermediate', instructions: 'Hang from bar, pull chin above bar, lower with control.', emoji: '🧗'),
    Exercise(id: 'e7', name: 'Dips', muscleGroup: 'Chest', equipment: 'Bodyweight', difficulty: 'intermediate', instructions: 'Support on parallel bars, lower until upper arms parallel, press up.', emoji: '💪'),
    Exercise(id: 'e8', name: 'Lunges', muscleGroup: 'Legs', equipment: 'Dumbbells', difficulty: 'beginner', instructions: 'Step forward, lower back knee toward floor, push back to start.', emoji: '🦵'),
    Exercise(id: 'e9', name: 'Plank', muscleGroup: 'Core', equipment: 'Bodyweight', difficulty: 'beginner', instructions: 'Forearms and toes on floor, body straight line, hold position.', emoji: '🧘'),
    Exercise(id: 'e10', name: 'Bicep Curls', muscleGroup: 'Arms', equipment: 'Dumbbells', difficulty: 'beginner', instructions: 'Arms at sides, curl weights to shoulders, lower slowly.', emoji: '💪'),
    Exercise(id: 'e11', name: 'Tricep Pushdown', muscleGroup: 'Arms', equipment: 'Cable', difficulty: 'beginner', instructions: 'Grip cable bar, elbows at sides, push down to full extension.', emoji: '💪'),
    Exercise(id: 'e12', name: 'Leg Press', muscleGroup: 'Legs', equipment: 'Machine', difficulty: 'beginner', instructions: 'Feet shoulder-width on platform, lower sled to 90 degrees, press up.', emoji: '🦵'),
  ];

  // ─── Programs ─────────────────────────────────────────
  late final List<WorkoutProgram> programs = [
    WorkoutProgram(id: 'p1', name: 'Strength Builder', description: 'Build foundational strength with compound lifts', difficulty: 'intermediate', durationWeeks: 8, daysPerWeek: 4, focus: 'strength', days: [
      ProgramDay(dayNumber: 1, name: 'Upper Body Push', estimatedMinutes: 50, exercises: [
        const WorkoutExercise(exerciseId: 'e1', name: 'Bench Press', muscleGroup: 'Chest', sets: 4, reps: '6-8', weight: 135, restSeconds: 120),
        const WorkoutExercise(exerciseId: 'e4', name: 'Overhead Press', muscleGroup: 'Shoulders', sets: 3, reps: '8-10', weight: 85, restSeconds: 90),
        const WorkoutExercise(exerciseId: 'e7', name: 'Dips', muscleGroup: 'Chest', sets: 3, reps: '10-12', restSeconds: 60),
        const WorkoutExercise(exerciseId: 'e11', name: 'Tricep Pushdown', muscleGroup: 'Arms', sets: 3, reps: '12-15', weight: 40, restSeconds: 60),
      ]),
      ProgramDay(dayNumber: 2, name: 'Lower Body', estimatedMinutes: 55, exercises: [
        const WorkoutExercise(exerciseId: 'e2', name: 'Squat', muscleGroup: 'Legs', sets: 4, reps: '6-8', weight: 185, restSeconds: 120),
        const WorkoutExercise(exerciseId: 'e3', name: 'Deadlift', muscleGroup: 'Back', sets: 3, reps: '5', weight: 225, restSeconds: 180),
        const WorkoutExercise(exerciseId: 'e12', name: 'Leg Press', muscleGroup: 'Legs', sets: 3, reps: '10-12', weight: 270, restSeconds: 90),
        const WorkoutExercise(exerciseId: 'e8', name: 'Lunges', muscleGroup: 'Legs', sets: 3, reps: '10 each', weight: 30, restSeconds: 60),
      ]),
      ProgramDay(dayNumber: 3, name: 'Upper Body Pull', estimatedMinutes: 45, exercises: [
        const WorkoutExercise(exerciseId: 'e5', name: 'Barbell Row', muscleGroup: 'Back', sets: 4, reps: '6-8', weight: 115, restSeconds: 90),
        const WorkoutExercise(exerciseId: 'e6', name: 'Pull-ups', muscleGroup: 'Back', sets: 3, reps: '8-10', restSeconds: 90),
        const WorkoutExercise(exerciseId: 'e10', name: 'Bicep Curls', muscleGroup: 'Arms', sets: 3, reps: '10-12', weight: 30, restSeconds: 60),
      ]),
      ProgramDay(dayNumber: 4, name: 'Core & Conditioning', estimatedMinutes: 35, exercises: [
        const WorkoutExercise(exerciseId: 'e9', name: 'Plank', muscleGroup: 'Core', sets: 3, reps: '60s', restSeconds: 45),
      ]),
    ]),
  ];

  // ─── Workout History ──────────────────────────────────
  final List<WorkoutLog> _logs = [
    WorkoutLog(id: 'l1', programId: 'p1', dayName: 'Upper Body Push', date: DateTime.now().subtract(const Duration(days: 1)), durationMinutes: 52, caloriesBurned: 340, exercises: [
      const ExerciseLog(exerciseName: 'Bench Press', sets: [SetLog(reps: 8, weight: 135), SetLog(reps: 7, weight: 145), SetLog(reps: 6, weight: 155), SetLog(reps: 6, weight: 155)]),
      const ExerciseLog(exerciseName: 'Overhead Press', sets: [SetLog(reps: 10, weight: 85), SetLog(reps: 8, weight: 90), SetLog(reps: 8, weight: 90)]),
    ]),
    WorkoutLog(id: 'l2', programId: 'p1', dayName: 'Lower Body', date: DateTime.now().subtract(const Duration(days: 3)), durationMinutes: 58, caloriesBurned: 420, exercises: [
      const ExerciseLog(exerciseName: 'Squat', sets: [SetLog(reps: 8, weight: 185), SetLog(reps: 6, weight: 205), SetLog(reps: 6, weight: 205), SetLog(reps: 5, weight: 215)]),
      const ExerciseLog(exerciseName: 'Deadlift', sets: [SetLog(reps: 5, weight: 225), SetLog(reps: 5, weight: 245), SetLog(reps: 3, weight: 265)]),
    ]),
  ];

  List<WorkoutLog> get logs => List.unmodifiable(_logs);
  int get totalWorkouts => _logs.length;
  int get thisWeekWorkouts => _logs.where((l) => l.date.isAfter(DateTime.now().subtract(const Duration(days: 7)))).length;

  // ─── Measurements ─────────────────────────────────────
  final List<BodyMeasurement> _measurements = [
    BodyMeasurement(date: DateTime.now().subtract(const Duration(days: 28)), weight: 185.0, bodyFat: 18.5, chest: 42.0, waist: 34.0),
    BodyMeasurement(date: DateTime.now().subtract(const Duration(days: 21)), weight: 183.5, bodyFat: 18.0, chest: 42.0, waist: 33.5),
    BodyMeasurement(date: DateTime.now().subtract(const Duration(days: 14)), weight: 182.0, bodyFat: 17.5, chest: 42.5, waist: 33.0),
    BodyMeasurement(date: DateTime.now().subtract(const Duration(days: 7)), weight: 181.0, bodyFat: 17.0, chest: 42.5, waist: 33.0),
    BodyMeasurement(date: DateTime.now(), weight: 180.0, bodyFat: 16.5, chest: 43.0, waist: 32.5),
  ];

  List<BodyMeasurement> get measurements => List.unmodifiable(_measurements);
  BodyMeasurement? get latestMeasurement => _measurements.isNotEmpty ? _measurements.last : null;

  // ─── Personal Records ─────────────────────────────────
  final List<PersonalRecord> _records = [
    PersonalRecord(exercise: 'Bench Press', weight: 185, reps: 1, date: DateTime.now().subtract(const Duration(days: 5))),
    PersonalRecord(exercise: 'Squat', weight: 265, reps: 1, date: DateTime.now().subtract(const Duration(days: 3))),
    PersonalRecord(exercise: 'Deadlift', weight: 315, reps: 1, date: DateTime.now().subtract(const Duration(days: 10))),
    PersonalRecord(exercise: 'Overhead Press', weight: 115, reps: 1, date: DateTime.now().subtract(const Duration(days: 7))),
  ];

  List<PersonalRecord> get records => List.unmodifiable(_records);

  // ─── Weekly Stats ─────────────────────────────────────
  final List<WeeklyStats> weeklyStats = const [
    WeeklyStats(week: 'W1', workouts: 3, totalMinutes: 145, totalCalories: 980, avgWeight: 185.0),
    WeeklyStats(week: 'W2', workouts: 4, totalMinutes: 200, totalCalories: 1340, avgWeight: 183.5),
    WeeklyStats(week: 'W3', workouts: 4, totalMinutes: 195, totalCalories: 1280, avgWeight: 182.0),
    WeeklyStats(week: 'W4', workouts: 3, totalMinutes: 160, totalCalories: 1100, avgWeight: 181.0),
    WeeklyStats(week: 'W5', workouts: 2, totalMinutes: 110, totalCalories: 760, avgWeight: 180.0),
  ];

  // ─── Active Workout Timer ─────────────────────────────
  int _restSecondsRemaining = 0;
  bool get isResting => _restSecondsRemaining > 0;
  int get restSecondsRemaining => _restSecondsRemaining;

  void startRestTimer(int seconds) {
    _restSecondsRemaining = seconds;
    notifyListeners();
    _tickTimer();
  }

  void _tickTimer() {
    if (_restSecondsRemaining <= 0) return;
    Future.delayed(const Duration(seconds: 1), () {
      _restSecondsRemaining--;
      notifyListeners();
      if (_restSecondsRemaining > 0) _tickTimer();
    });
  }

  void cancelRestTimer() {
    _restSecondsRemaining = 0;
    notifyListeners();
  }

  void addMeasurement(BodyMeasurement m) {
    _measurements.add(m);
    notifyListeners();
  }

  List<Exercise> filterExercises({String? muscleGroup, String? equipment}) {
    var result = exercises.toList();
    if (muscleGroup != null) result = result.where((e) => e.muscleGroup == muscleGroup).toList();
    if (equipment != null) result = result.where((e) => e.equipment == equipment).toList();
    return result;
  }

  List<String> get muscleGroups => exercises.map((e) => e.muscleGroup).toSet().toList()..sort();
  List<String> get equipmentTypes => exercises.map((e) => e.equipment).toSet().toList()..sort();
}
