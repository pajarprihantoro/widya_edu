import 'package:app_widya_edu/src/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_string.dart';
import '../../data/models/course_model.dart';
import '../../data/models/subject_data_pelajaran.dart';

import '../manager/course/course_bloc.dart';
import 'exercises_list_screen.dart';

class AllCourse extends StatelessWidget {
  const AllCourse({super.key, required List<CourseData> courseList});

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.lightgrey,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        title: const Text(
          AppString.pilihPelajaran,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          if (state is CourseSuccess) {
            return Container(
              padding: EdgeInsets.only(top: 20, left: 40, right: 40),
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemCount: dataPelajaran.length,
                itemBuilder: (context, index) {
                  final exercises = state.courseList[index].courseName;
                  return _buildCourseListWidget(
                    sizeScreen,
                    state.courseList.cast<CourseData>(),
                  );
                },
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  ListView _buildCourseListWidget(sizeScreen, List<CourseData> courseList) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) => SizedBox(height: 10),
        shrinkWrap: true,
        itemCount: courseList.length,
        itemBuilder: (context, index) {
          final exercises = courseList[index];
          return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExercisesListScreen(
                      courseId: exercises.courseId ?? 'no id',
                      courseName: exercises.courseName,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(20),
                height: sizeScreen.height * 0.12,
                width: sizeScreen.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightgrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: sizeScreen.width * 0.15,
                      child: Image.network(
                        courseList[index].urlCover ?? '',
                        fit: BoxFit.cover,
                        errorBuilder: (context, eror, stackTrace) => Container(
                          width: 70,
                          height: 70,
                          color: Colors.white,
                          child: Image.asset(AppImg.imgIconMtk2),
                        ),
                        width: 70,
                        height: 70,
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          courseList[index].courseName.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                            '${courseList[index].jumlahDone}/${courseList[index].jumlahMateri}'),
                        SizedBox(height: 5),
                        Container(
                          width: sizeScreen.width * 0.45,
                          child: LinearProgressIndicator(
                            value: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        });
  }
}
