import 'package:flutter/material.dart';
import '../providers/fitness_provider.dart';

class HomeScreen extends StatelessWidget {
  final FitnessProvider provider;
  final void Function(int) onNavigate;

  const HomeScreen({super.key, required this.provider, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final latest = provider.latestMeasurement;
    final stats = provider.weeklyStats;

    return Scaffold(
      appBar: AppBar(title: const Text('FitTracker', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Quick Stats
          Row(children: [
            _StatCard(icon: '🏋️', value: '${provider.thisWeekWorkouts}', label: 'This Week', color: Colors.blue),
            const SizedBox(width: 12),
            _StatCard(icon: '🔥', value: '${provider.totalWorkouts}', label: 'Total', color: Colors.orange),
            const SizedBox(width: 12),
            _StatCard(icon: '⚖️', value: latest != null ? '${latest.weight}' : '--', label: 'lbs', color: Colors.green),
          ]),
          const SizedBox(height: 24),

          // Current Program
          const Text('Current Program', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          if (provider.programs.isNotEmpty) ...[
            _ProgramCard(program: provider.programs.first, onTap: () => onNavigate(1)),
          ],

          // Weekly Chart
          const SizedBox(height: 24),
          const Text('Weekly Progress', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          Container(
            height: 160,
            decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey[200]!)),
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: stats.map((s) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${s.workouts}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Container(
                        height: (s.workouts / 5 * 80).clamp(8, 80),
                        decoration: BoxDecoration(color: Colors.blue.withOpacity(0.7), borderRadius: BorderRadius.circular(4)),
                      ),
                      const SizedBox(height: 6),
                      Text(s.week, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                    ],
                  ),
                ),
              )).toList(),
            ),
          ),

          // Personal Records
          const SizedBox(height: 24),
          const Text('Personal Records 🏆', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          ...provider.records.map((pr) => ListTile(
            dense: true,
            leading: const Text('🏅', style: TextStyle(fontSize: 24)),
            title: Text(pr.exercise, style: const TextStyle(fontWeight: FontWeight.w600)),
            trailing: Text('${pr.weight.toStringAsFixed(0)} lbs x ${pr.reps}', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
          )),

          // Recent Workouts
          const SizedBox(height: 24),
          const Text('Recent Workouts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          ...provider.logs.map((log) => Card(
            child: ListTile(
              leading: Container(width: 44, height: 44, decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(10)), child: const Center(child: Text('💪', style: TextStyle(fontSize: 22)))),
              title: Text(log.dayName, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text('${log.durationMinutes}min · ${log.caloriesBurned} cal'),
              trailing: Text('${log.date.month}/${log.date.day}', style: TextStyle(color: Colors.grey[500])),
            ),
          )),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String icon, value, label;
  final Color color;
  const _StatCard({required this.icon, required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(12), border: Border.all(color: color.withOpacity(0.2))),
      child: Column(children: [
        Text(icon, style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 6),
        Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: color)),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ]),
    ));
  }
}

class _ProgramCard extends StatelessWidget {
  final dynamic program;
  final VoidCallback onTap;
  const _ProgramCard({required this.program, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(6)), child: Text(program.difficulty.toString().toUpperCase(), style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.blue[700]))),
              const Spacer(),
              Text('${program.daysPerWeek} days/week', style: TextStyle(fontSize: 13, color: Colors.grey[600])),
            ]),
            const SizedBox(height: 10),
            Text(program.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text(program.description, style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 10),
            Text('${program.durationWeeks} weeks · ${program.days.length} workouts', style: TextStyle(fontSize: 13, color: Colors.grey[500])),
          ]),
        ),
      ),
    );
  }
}
