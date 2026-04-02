import 'package:flutter/material.dart';
import '../providers/fitness_provider.dart';

class ProgressScreen extends StatelessWidget {
  final FitnessProvider provider;
  const ProgressScreen({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final measurements = provider.measurements;
    final stats = provider.weeklyStats;

    return Scaffold(
      appBar: AppBar(title: const Text('Progress')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Body Weight Chart
          const Text('Body Weight (lbs)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          Container(
            height: 160,
            decoration: BoxDecoration(color: Colors.green.withOpacity(0.05), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.green.withOpacity(0.2))),
            padding: const EdgeInsets.all(16),
            child: measurements.isEmpty
              ? const Center(child: Text('No measurements yet'))
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: measurements.map((m) {
                    final min = 175.0;
                    final max = 190.0;
                    final pct = ((m.weight ?? 0) - min) / (max - min);
                    return Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Text('${m.weight?.toStringAsFixed(0)}', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Container(height: (pct * 80).clamp(8.0, 80.0), decoration: BoxDecoration(color: Colors.green.withOpacity(0.6), borderRadius: BorderRadius.circular(4))),
                        const SizedBox(height: 4),
                        Text('${m.date.month}/${m.date.day}', style: TextStyle(fontSize: 10, color: Colors.grey[600])),
                      ]),
                    ));
                  }).toList(),
                ),
          ),

          // Body Fat
          const SizedBox(height: 24),
          const Text('Body Fat %', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          Container(
            height: 140,
            decoration: BoxDecoration(color: Colors.orange.withOpacity(0.05), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.orange.withOpacity(0.2))),
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: measurements.where((m) => m.bodyFat != null).map((m) {
                final pct = ((m.bodyFat! - 14) / 6).clamp(0.0, 1.0);
                return Expanded(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text('${m.bodyFat?.toStringAsFixed(1)}%', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Container(height: (pct * 60).clamp(8.0, 60.0), decoration: BoxDecoration(color: Colors.orange.withOpacity(0.6), borderRadius: BorderRadius.circular(4))),
                    const SizedBox(height: 4),
                    Text('${m.date.month}/${m.date.day}', style: TextStyle(fontSize: 10, color: Colors.grey[600])),
                  ]),
                ));
              }).toList(),
            ),
          ),

          // Weekly Summary
          const SizedBox(height: 24),
          const Text('Weekly Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          ...stats.map((s) => Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(children: [
                Container(
                  width: 40, height: 40,
                  decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(8)),
                  child: Center(child: Text(s.week, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.blue[700]))),
                ),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('${s.workouts} workouts · ${s.totalMinutes} min', style: const TextStyle(fontWeight: FontWeight.w600)),
                  Text('${s.totalCalories} cal burned · ${s.avgWeight.toStringAsFixed(1)} lbs avg', style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                ])),
              ]),
            ),
          )),

          // Measurements Table
          const SizedBox(height: 24),
          const Text('Body Measurements', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          Table(
            border: TableBorder.all(color: Colors.grey[200]!, borderRadius: BorderRadius.circular(8)),
            columnWidths: const {0: FlexColumnWidth(1.2)},
            children: [
              TableRow(
                decoration: BoxDecoration(color: Colors.grey[50]),
                children: ['Date', 'Weight', 'BF%', 'Chest', 'Waist'].map((h) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(h, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                )).toList(),
              ),
              ...measurements.map((m) => TableRow(children: [
                _cell('${m.date.month}/${m.date.day}'),
                _cell(m.weight != null ? '${m.weight}' : '--'),
                _cell(m.bodyFat != null ? '${m.bodyFat}%' : '--'),
                _cell(m.chest != null ? '${m.chest}"' : '--'),
                _cell(m.waist != null ? '${m.waist}"' : '--'),
              ])),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _cell(String text) => Padding(padding: const EdgeInsets.all(8), child: Text(text, style: const TextStyle(fontSize: 13)));
}
