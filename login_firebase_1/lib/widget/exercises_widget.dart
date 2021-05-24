import 'package:login_firebase_1/data/exercise_sets.dart';
import 'package:login_firebase_1/models/exercise_set.dart';
import 'package:flutter/material.dart';

import 'exercise_set_widget.dart';

class ExercisesWidget extends StatefulWidget {
  @override
  _ExercisesWidgetState createState() => _ExercisesWidgetState();
}

class _ExercisesWidgetState extends State<ExercisesWidget> {
  ExerciseType selectedType = ExerciseType.low;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            SizedBox(height: 8),
            buildDifficultyLevel(),
            SizedBox(height: 8),
            buildWorkouts(),
          ],
        ),
      ),
    );
  }

  Widget buildWorkouts() {
    return GestureDetector(
      onHorizontalDragEnd: swipeFunction,
      child: Column(
        children: exerciseSets
            .where((element) => element.exerciseType == selectedType)
            .map(
              (exerciseSet) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ExerciseSetWidget(exerciseSet: exerciseSet)),
            )
            .toList(),
      ),
    );
  }

  Widget buildDifficultyLevel() {
    return Row(
      children: ExerciseType.values.map(
        (type) {
          final name = getExerciseName(type);
          final fontWeight =
              selectedType == type ? FontWeight.bold : FontWeight.normal;

          return Expanded(
            child: Center(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => setState(() => selectedType = type),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    name,
                    style: TextStyle(fontWeight: fontWeight, fontSize: 16),
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  void swipeFunction(DragEndDetails dragEndDetails) {
    final selectedIndex = ExerciseType.values.indexOf(selectedType);
    final hasNext = selectedIndex < ExerciseType.values.length;
    final hasPrevious = selectedIndex > 0;

    setState(() {
      if (dragEndDetails.primaryVelocity < 0 && hasNext) {
        final nextType = ExerciseType.values[selectedIndex + 1];
        selectedType = nextType;
      }
      if (dragEndDetails.primaryVelocity > 0 && hasPrevious) {
        final previousType = ExerciseType.values[selectedIndex - 1];
        selectedType = previousType;
      }
    });
  }
}
