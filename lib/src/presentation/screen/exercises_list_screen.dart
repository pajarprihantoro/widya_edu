import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_widya_edu/src/data/data_source/exercises_data_source.dart';
import 'package:app_widya_edu/src/domain/repositories/course_repository.dart';
import 'package:app_widya_edu/src/domain/usecases/get_exercises_usecase.dart';
import 'package:app_widya_edu/src/presentation/screen/question_list_screen.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_images.dart';
import '../../core/utils/app_string.dart';
import '../../data/models/exercises_model.dart';
import '../../data/repository/exercises_repository_impl.dart';
import '../../domain/repositories/exercises_repository.dart';
import '../manager/exercises/bloc/exercises_bloc.dart';

class ExercisesListScreen extends StatefulWidget {
  final String courseId;
  final String? courseName;

  ExercisesListScreen({
    Key? key,
    required this.courseId,
    this.courseName,
  }) : super(key: key);

  @override
  State<ExercisesListScreen> createState() => _ExercisesListScreenState();
}

class _ExercisesListScreenState extends State<ExercisesListScreen> {
  String? courseName;
  static Future<List<ExercisesRespon>?>? _getExercisesList;

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;

    return BlocProvider<ExercisesBloc>(
      create: (context) {
        final exercisesDataSource = ExercisesDataSource(widget.courseId);
        final exercisesRepository =
            ExercisesRepositoryImpl(exercisesDataSource);
        return ExercisesBloc(
          GetExercisesUsecase(exercisesRepository, widget.courseId),
          exercisesRepository: exercisesRepository,
        )..add(
            GetExecisesEvent(widget.courseId),
          );
      },
      child: Scaffold(
        backgroundColor: AppColors.lightgrey,
        appBar: AppBar(
          backgroundColor: AppColors.blue,
          title: Text(widget.courseName ?? 'no name'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: BlocBuilder<ExercisesBloc, ExercisesState>(
          builder: (context, state) {
            if (state is ExercisesEror) {
              if (state.message == 'data not found') {
                return Container(
                  width: sizeScreen.width * 0.9,
                  height: 200,
                  child: Image.asset(AppImg.notifNot),
                  // child: Text('tidak ada data'),
                );
              }
            }
            if (state is ExercisesSuccess) {
              return Container(
                padding: EdgeInsets.only(top: 20, left: 45, right: 45),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      AppString.pilihPaket,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: sizeScreen.width * 0.9,
                      height: 500,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: state.exercisesList.length,
                        itemBuilder: (BuildContext context, index) {
                          final exercises = state.exercisesList[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuestionsListScreen(
                                        exercisesIdFk:
                                            exercises.exerciseId.toString(),
                                        courseName: exercises.exerciseTitle)),
                              );
                            },
                            child: Container(
                              height: sizeScreen.height * 0.1,
                              width: sizeScreen.height * 0.1,
                              decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Expanded(
                                  child: Column(children: [
                                    Image.network(
                                      width: 30,
                                      height: 30,
                                      exercises.icon ?? 'no image',
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Container(
                                                  width: 40,
                                                  height: 40,
                                                  child: Image.asset(
                                                    AppImg.imgExercises,
                                                  )),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      exercises.exerciseTitle ?? 'no title',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.center,
                                    ),
                                    Text('${exercises.jumlahSoal} Soal' ??
                                        'belum selesai'),
                                  ]),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
