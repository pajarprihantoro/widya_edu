import 'package:app_widya_edu/src/presentation/manager/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_images.dart';
import '../../core/utils/app_string.dart';
import '../widgets/buttonLogin.dart';
import 'home_screen.dart';
import 'register.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.lightgrey,
      appBar: AppBar(
        title: Text(
          AppString.login,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: AppColors.lightgrey,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset(AppImg.imgLogin),
                  SizedBox(height: 20),
                  const Text(
                    AppString.selamatDatang,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    AppString.appWidyaEdu,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  BlocConsumer<AuthBloc, AuthState>(
                    listenWhen: (prev, next) =>
                        prev is SignInWithGoogleLoading &&
                        (next is SignInWithGoogleEror ||
                            next is SignInWithGoogleSuccess),
                    listener: (context, state) {
                      print('listener : authbloc');
                      if (state is SignInWithGoogleSuccess) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Register()));
                      }
                    },
                    buildWhen: (prev, next) =>
                        prev is SignInWithGoogleLoading &&
                        (next is SignInWithGoogleEror ||
                            next is SignInWithGoogleSuccess),
                    builder: (context, state) {
                      print('build : authbloc');
                      if (state is SignInWithGoogleLoading) {
                        return CircularProgressIndicator();
                      }

                      return LoginButton(
                        loginButtonVariant: LoginButtonVariant.google,
                        onPressed: () {
                          context.read<AuthBloc>().add(SignInWithGoogleEvent());
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  LoginButton(
                    loginButtonVariant: LoginButtonVariant.apple,
                    onPressed: () {
                      // Navigator.pushNamed(
                      //     context,
                      //     MaterialPageRoute(
                      //             builder: (context) => const HomeScreen())
                      //         as String);
                    },
                  ),
                  const SizedBox(height: 10),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(AppString.belumPunyaAkun),
                  //     TextButton(
                  //       onPressed: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(builder: (context) => Register()),
                  //         );
                  //       },
                  //       child: Text(AppString.daftar),
                  //     )
                  //   ],
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
