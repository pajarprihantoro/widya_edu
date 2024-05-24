import '../../core/utils/app_images.dart';

class Subject {
  final String name;
  final int exerciseTotal;
  final int exerciseDone;
  final String img;

  Subject(
      {required this.name,
      required this.exerciseDone,
      required this.exerciseTotal,
      required this.img});
}

final List<Subject> dataPelajaran = [
  Subject(
      name: "Matematika",
      exerciseDone: 0,
      exerciseTotal: 50,
      img: AppImg.imgIconMtk),
  Subject(
      name: "Fisika",
      exerciseDone: 0,
      exerciseTotal: 50,
      img: AppImg.imgIconFisika),
  Subject(
      name: "Kimia",
      exerciseDone: 0,
      exerciseTotal: 50,
      img: AppImg.imgIconKimia),
  Subject(
      name: "Biologi",
      exerciseDone: 0,
      exerciseTotal: 50,
      img: AppImg.imgIconBiologi),
  Subject(
      name: "Bahasa Indonesia",
      exerciseDone: 0,
      exerciseTotal: 50,
      img: AppImg.imgIconIndo),
  Subject(
      name: "Bahasa Inggris",
      exerciseDone: 0,
      exerciseTotal: 50,
      img: AppImg.imgIconInggris),
];
