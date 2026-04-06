import 'package:flutter/material.dart';
import '../providers/fitness_provider.dart';

class ExerciseLibraryScreen extends StatefulWidget {
  final FitnessProvider provider;
  const ExerciseLibraryScreen({super.key, required this.provider});

  @override
  State<ExerciseLibraryScreen> createState() => _ExerciseLibraryScreenState();
}

class _ExerciseLibraryScreenState extends State<ExerciseLibraryScreen> {
  String? _selectedMuscle;
  String? _selectedEquipment;

  @override
  Widget build(BuildContext context) {
    final exercises = widget.provider.filterExercises(muscleGroup: _selectedMuscle, equipment: _selectedEquipment);
    final muscles = widget.provider.muscleGroups;
    final equipment = widget.provider.equipmentTypes;

    return Scaffold(
      appBar: AppBar(title: const Text('Exercise Library')),
      body: Column(
        children: [
          SizedBox(
            height: 44,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                _chip('All Muscles', _selectedMuscle == null, () => setState(() => _selectedMuscle = null)),
                ...muscles.map((m) => _chip(m, _selectedMuscle == m, () => setState(() => _selectedMuscle = _selectedMuscle == m ? null : m))),
              ],
            ),
          ),
          SizedBox(
            height: 44,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                _chip('All Equipment', _selectedEquipment == null, () => setState(() => _selectedEquipment = null)),
                ...equipment.map((e) => _chip(e, _selectedEquipment == e, () => setState(() => _selectedEquipment = _selectedEquipment == e ? null : e))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('${exercises.length} exercises', style: TextStyle(color: Colors.grey[500], fontSize: 13)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (_, i) {
                final ex = exercises[i];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: ExpansionTile(
                    leading: Text(ex.emoji, style: const TextStyle(fontSize: 28)),
                    title: Text(ex.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text('${ex.muscleGroup} · ${ex.equipment} · ${ex.difficulty}'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Text(ex.instructions, style: TextStyle(color: Colors.grey[700], height: 1.4)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, bool selected, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label, style: TextStyle(fontSize: 13, fontWeight: selected ? FontWeight.w600 : FontWeight.w400)),
        selected: selected,
        onSelected: (_) => onTap(),
        selectedColor: Colors.blue[50],
      ),
    );
  }
}
