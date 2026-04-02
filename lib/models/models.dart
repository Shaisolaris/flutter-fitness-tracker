class WorkoutProgram {
  final String id;
  final String name;
  final String description;
  final String difficulty; // beginner, intermediate, advanced
  final int durationWeeks;
  final int daysPerWeek;
  final String focus; // strength, cardio, flexibility, full-body
  final List<ProgramDay> days;

  const WorkoutProgram({required this.id, required this.name, required this.description, required this.difficulty, required this.durationWeeks, required this.daysPerWeek, required this.focus, this.days = const []});
}

class ProgramDay {
  final int dayNumber;
  final String name;
  final List<WorkoutExercise> exercises;
  final int estimatedMinutes;

  const ProgramDay({required this.dayNumber, required this.name, required this.exercises, required this.estimatedMinutes});
}

class WorkoutExercise {
  final String exerciseId;
  final String name;
  final String muscleGroup;
  final int sets;
  final String reps; // "8-12" or "30s" for timed
  final double? weight;
  final int restSeconds;
  final bool isCompleted;

  const WorkoutExercise({required this.exerciseId, required this.name, required this.muscleGroup, required this.sets, required this.reps, this.weight, this.restSeconds = 60, this.isCompleted = false});

  WorkoutExercise copyWith({double? weight, bool? isCompleted}) => WorkoutExercise(exerciseId: exerciseId, name: name, muscleGroup: muscleGroup, sets: sets, reps: reps, weight: weight ?? this.weight, restSeconds: restSeconds, isCompleted: isCompleted ?? this.isCompleted);
}

class Exercise {
  final String id;
  final String name;
  final String muscleGroup;
  final String equipment;
  final String difficulty;
  final String instructions;
  final String emoji;

  const Exercise({required this.id, required this.name, required this.muscleGroup, required this.equipment, required this.difficulty, required this.instructions, required this.emoji});
}

class WorkoutLog {
  final String id;
  final String programId;
  final String dayName;
  final DateTime date;
  final int durationMinutes;
  final int caloriesBurned;
  final List<ExerciseLog> exercises;

  const WorkoutLog({required this.id, required this.programId, required this.dayName, required this.date, required this.durationMinutes, required this.caloriesBurned, required this.exercises});
}

class ExerciseLog {
  final String exerciseName;
  final List<SetLog> sets;

  const ExerciseLog({required this.exerciseName, required this.sets});
}

class SetLog {
  final int reps;
  final double weight;
  final bool completed;

  const SetLog({required this.reps, required this.weight, this.completed = true});
}

class BodyMeasurement {
  final DateTime date;
  final double? weight;
  final double? bodyFat;
  final double? chest;
  final double? waist;
  final double? hips;
  final double? arms;

  const BodyMeasurement({required this.date, this.weight, this.bodyFat, this.chest, this.waist, this.hips, this.arms});
}

class PersonalRecord {
  final String exercise;
  final double weight;
  final int reps;
  final DateTime date;

  const PersonalRecord({required this.exercise, required this.weight, required this.reps, required this.date});
}

class WeeklyStats {
  final String week;
  final int workouts;
  final int totalMinutes;
  final int totalCalories;
  final double avgWeight;

  const WeeklyStats({required this.week, required this.workouts, required this.totalMinutes, required this.totalCalories, required this.avgWeight});
}
