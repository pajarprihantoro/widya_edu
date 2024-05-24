import 'package:app_widya_edu/src/presentation/manager/auth/bloc/auth_bloc.dart';
import 'package:app_widya_edu/src/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_images.dart';
import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    // Future.delayed(Duration(seconds: 5)).then(
    //   (value) => Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => Login(),
    //     ),
    //   ),
    // );

    context.read<AuthBloc>().add(IsSignedWithGoogleEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (AuthState prevState, AuthState nextState) =>
          prevState is IsSignInWithGoogleLoading &&
          (nextState is IsSignInWithGoogleSuccess ||
              nextState is IsSignInWithGoogleEror),
      listener: (context, state) {
        if (state is IsSignInWithGoogleSuccess) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }

        if (state is IsSignInWithGoogleEror) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Login()));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.blue,
        body: Center(
          child: Image.asset(AppImg.imgSplash),
        ),
      ),
    );
  }
}
