# flutter-fitness-tracker

Flutter fitness tracker with workout programs, exercise library with muscle/equipment filters, progress tracking with body weight and body fat charts, personal records, weekly stats, body measurement tables, and rest timer. Dart-only with ChangeNotifier state management and Material Design 3.

## Stack

- **Framework:** Flutter 3.x, Dart 3.3+
- **State:** ChangeNotifier (FitnessProvider)
- **Design:** Material Design 3 with NavigationBar

## Features

### Dashboard
- Quick stats: workouts this week, total workouts, current body weight
- Current program card with difficulty badge, schedule, and description
- Weekly workout bar chart (5 weeks)
- Personal records with exercise name and weight
- Recent workout history with duration and calories

### Exercise Library
- 12 exercises across 5 muscle groups and 4 equipment types
- Dual filter: muscle group chips + equipment chips
- Expandable cards with exercise instructions
- Exercise count display after filtering
- Emoji icons per exercise

### Progress Tracking
- Body weight bar chart with date labels
- Body fat percentage chart
- Weekly summary cards (workouts, minutes, calories, avg weight)
- Body measurements table (date, weight, body fat, chest, waist)
- 5 weeks of historical data

### Workout Programs
- Structured programs with named days (Upper Push, Lower Body, Upper Pull, Core)
- Exercise sets with rep ranges and weight targets
- Rest timer between sets with countdown
- Estimated duration per workout day

## Architecture

```
lib/
├── main.dart                              # App with bottom NavigationBar
├── models/models.dart                     # WorkoutProgram, Exercise, WorkoutLog, BodyMeasurement, etc.
├── providers/fitness_provider.dart        # State: programs, exercises, logs, measurements, records, timer
├── screens/
│   ├── home_screen.dart                   # Dashboard with stats, program, chart, PRs, history
│   ├── exercise_library_screen.dart       # Filterable exercise list with expandable details
│   └── progress_screen.dart               # Weight/BF charts, weekly summary, measurements table
└── theme/                                 # (using inline Material 3 theme)
```

## Data

- 12 exercises (Bench Press, Squat, Deadlift, OHP, Row, Pull-ups, Dips, Lunges, Plank, Curls, Pushdowns, Leg Press)
- 1 structured program (Strength Builder) with 4 training days
- 2 workout logs with per-set data
- 5 body measurements over 4 weeks showing weight loss progression
- 4 personal records for compound lifts
- 5 weeks of aggregated weekly stats

## Setup

```bash
git clone https://github.com/Shaisolaris/flutter-fitness-tracker.git
cd flutter-fitness-tracker
flutter create .
flutter pub get
flutter run
```

## Key Design Decisions

**Custom bar charts over charting libraries.** Weight and body fat charts use simple Container widgets with calculated heights. This keeps dependencies minimal and renders instantly without async chart initialization.

**Exercise library with dual filtering.** Users can filter by muscle group AND equipment simultaneously. FilterChips provide clear selected state. Deselecting returns to unfiltered view. This pattern scales well for larger exercise databases.

**Structured workout programs.** Programs contain named days with specific exercises, rep ranges, and rest periods. This mirrors real training programs (PPL, Upper/Lower) rather than ad-hoc workout logging.

**Rest timer in provider.** The countdown timer lives in FitnessProvider using recursive Future.delayed calls. This avoids Timer dependency and automatically notifies listeners each tick, updating any screen displaying the timer.

## License

MIT
