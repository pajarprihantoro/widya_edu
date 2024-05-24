import 'dart:ffi';

import 'package:app_widya_edu/src/domain/entities/course_entity.dart';
import 'package:app_widya_edu/src/domain/repositories/course_repository.dart';
import 'package:app_widya_edu/src/presentation/screen/discussion_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:faker/faker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

import 'package:app_widya_edu/src/data/data_source/course_data_source.dart';
import 'package:app_widya_edu/src/data/repository/course_repository_impl.dart';
import 'package:app_widya_edu/src/domain/usecases/get_course_usecase.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_images.dart';
import '../../core/utils/app_string.dart';
import '../../data/models/course_model.dart';
import '../manager/banner/bloc/banner_bloc.dart';
import '../manager/course/course_bloc.dart';
import '../manager/home_nav/homenav_cubit.dart';
import 'all_course.dart';
import 'exercises.dart';
import 'exercises_list_screen.dart';
import 'login.dart';
import 'profil.dart';

class HomeScreen extends StatefulWidget {
  final courseId;

  HomeScreen({
    Key? key,
    this.courseId,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = 0;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DiscussionScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );
        break;
    }
  }
  final iconUserAktif = FirebaseAuth.instance.currentUser?.photoURL;

  final nameUserAktif = FirebaseAuth.instance.currentUser?.displayName;

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    List<Widget> homeBodyWidget = [
      HomeScreen(),
      DiscussionScreen(),
      Profile(),
    ];

    return Scaffold(
      backgroundColor: AppColors.lightgrey,
      appBar: AppBar(
        leadingWidth: 180,
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: AppColors.lightgrey,
        leading: Container(
          padding: EdgeInsets.only(
            left: 20,
            top: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hai, ' + nameUserAktif!,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                AppString.selamatDatang,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(iconUserAktif!),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: BlocBuilder<CourseBloc, CourseState>(
          builder: (context, state) {
            print('Current state ${state.runtimeType}');
            if (state is CourseEror) {
              return Text(
                'Gagal dalam pengambilan data',
                style: TextStyle(color: Colors.red),
              );
            }
            if (state is CourseSuccess) {
              return Container(
                height: sizeScreen.height,
                padding: EdgeInsets.only(left: 40, right: 40, bottom: 0),
                child: Container(
                  height: 50,
                  width: sizeScreen.width * 0.8,
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: sizeScreen.height * 0.15,
                        width: sizeScreen.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Mau kerjain\n'
                              'latihan soal\n'
                              'apa hari ini?',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Image.asset(AppImg.imgHome)],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              AppString.pilihPelajaran,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AllCourse(
                                            courseList: state.courseList
                                                .cast<CourseData>(),
                                          )),
                                );
                              },
                              child: Text(AppString.lihatSemua),
                            ),
                          ],
                        ),
                      ),
                      _buildCourseListWidget(sizeScreen, state.courseList),
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Terbaru",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: BlocBuilder<BannerBloc, BannerState>(
                              builder: (context, state) {
                                print('Current state ${state.runtimeType}');
                                if (state is BannerError) {
                                  return Text(
                                    'Gagal dalam pengambilan data',
                                    style: TextStyle(color: Colors.red),
                                  );
                                }
                                if (state is BannerSuccess) {
                                  return Row(
                                    children: [
                                      Container(
                                        width: sizeScreen.width * 0.9,
                                        height: 140,
                                        child: ListView.separated(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              final banner =
                                                  state.bannerList[index];
                                              return Image.network(
                                                banner.imgUrl,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                        AppImg.imgJadwal),
                                              );
                                            },
                                            separatorBuilder:
                                                (context, index) =>
                                                    SizedBox(width: 10),
                                            itemCount: state.bannerList.length),
                                      )
                                    ],
                                  );
                                }
                                return Center(
                                    child: const CircularProgressIndicator());
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
     bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Discussion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

ListView _buildCourseListWidget(sizeScreen, List<CourseData> courseList) {
  final courseCount = courseList.length > 3 ? 3 : courseList.length;

  return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => SizedBox(height: 10),
      shrinkWrap: true,
      itemCount: courseCount,
      itemBuilder: (context, index) {
        final exercises = courseList[index];

        return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExercisesListScreen(
                    courseId: exercises.courseId ?? 'no name',
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
