import 'package:flutter/material.dart';
import '../../data/data_source/exercises.dart';
import '../../data/models/model_exercises.dart';

class ExercisesScreen extends StatefulWidget {
  final String courseId;

  ExercisesScreen({
    Key? key,
    required this.courseId,
  }) : super(key: key);

  @override
  _ExercisesScreenState createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  Future<List<Exercises>?>? _exercisesFuture;

  @override
  void initState() {
    super.initState();
    _exercisesFuture =
        GetExercises.connectApi(widget.courseId, 'testerngbayu@gmail.com');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.courseId),
      ),
      body: FutureBuilder<List<Exercises>?>(
        future: _exercisesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No exercises found'));
          } else {
            List<Exercises> exercises = snapshot.data!;
            return ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                Exercises exercise = exercises[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(exercise.exerciseId ?? 'No ID'),
                        Text(widget.courseId),
                        // Tambahkan data lain yang ingin ditampilkan di sini
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
