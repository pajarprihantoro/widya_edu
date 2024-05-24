import 'package:app_widya_edu/src/core/utils/my_bloc_observer.dart';
import 'package:app_widya_edu/src/presentation/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  runApp(WidyaEdu());
}
