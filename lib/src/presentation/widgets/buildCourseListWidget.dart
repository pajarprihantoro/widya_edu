import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../data/models/course_model.dart';



ListView buildCourseListWidget(sizeScreen, List<CourseData> courseList) {
  final courseCountDetail = courseList.length;

  return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => SizedBox(height: 10),
      shrinkWrap: true,
      itemCount: courseCountDetail,
      itemBuilder: (context, index) {
        return Container(
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
                    width: 55,
                    height: 55,
                    color: Colors.grey,
                  ),
                  width: 50,
                  height: 50,
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
                      )),
                ],
              ),
            ],
          ),
        );
      });
}
