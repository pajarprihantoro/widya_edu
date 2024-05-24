import 'package:app_widya_edu/src/data/repository/profile_repository_impl.dart';
import 'package:app_widya_edu/src/domain/usecases/is_registed_usecase.dart';
import 'package:app_widya_edu/src/domain/usecases/register_usecase.dart';
import 'package:app_widya_edu/src/domain/usecases/upload_image_usecase.dart';
import 'package:app_widya_edu/src/presentation/manager/auth/bloc/auth_bloc.dart';
import 'package:app_widya_edu/src/presentation/manager/bloc_provider.dart';
import 'package:app_widya_edu/src/presentation/manager/home_nav/homenav_cubit.dart';
import 'package:app_widya_edu/src/presentation/manager/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_widya_edu/src/data/data_source/banner_data_source.dart';
import 'package:app_widya_edu/src/data/data_source/course_data_source.dart';
import 'package:app_widya_edu/src/data/repository/banner_repository_impl.dart';
import 'package:app_widya_edu/src/domain/usecases/get_banner_usecase.dart';
import 'package:app_widya_edu/src/domain/usecases/get_exercises_usecase.dart';

import '../data/data_source/auth_data_source.dart';
import '../data/repository/auth_repository_impl.dart';
import '../data/repository/course_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/banner_repository.dart';
import '../domain/repositories/course_repository.dart';
import '../domain/repositories/profile_repository.dart';
import '../domain/usecases/get_course_usecase.dart';
import '../domain/usecases/is_signed_in_with_google_usecase.dart';
import '../domain/usecases/sign_in_with_google_usecase.dart';
import 'manager/banner/bloc/banner_bloc.dart';
import 'manager/course/course_bloc.dart';
import 'screen/splash.dart';
import 'package:css_colors/css_colors.dart';

class WidyaEdu extends StatelessWidget {
  final CourseDataSource? courceDataSource;
  final CourseRepositoryImpl? courseRepositoryImpl;
  final BannerDataSource? bannerDataSource;
  final BannerRepositoryImpl? bannerepositoryImpl;
  final AuthDataSource? authDataSource;
  final AuthRepositoryImpl? authRepository;
  WidyaEdu(
      {Key? key,
      this.courceDataSource,
      this.courseRepositoryImpl,
      this.authDataSource,
      this.authRepository,
      this.bannerDataSource,
      this.bannerepositoryImpl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) {
            AuthDataSource authDataSource = AuthDataSource();
            AuthRepository authRepository = AuthRepositoryImpl(authDataSource);
            return AuthBloc(
                IsSignedWithGoogleInUsecase(authRepository),
                SignInWithGoogleUsecase(authRepository),
                IsRegistedUsecase(authRepository),
                RegisterUsecase(authRepository));
          },
        ),
        BlocProvider<CourseBloc>(
          create: (context) => CourseBloc(
            GetCourseUsecase(
              CourseRepositoryImpl(
                  CourseDataSource(courceDataSource, courseRepositoryImpl),
                  courseRepositoryImpl),
            ),
            courseRepository: CourseRepositoryImpl(
                courceDataSource ??
                    CourseDataSource(courceDataSource, courseRepositoryImpl),
                courseRepositoryImpl),
          )..add(GetCourseEvent()),
        ),
        BlocProvider<BannerBloc>(
          create: (context) => BannerBloc(
            GetBannerUsecase(
              BannerRepositoryImpl(
                BannerDataSource(),
              ),
            ),
          )..add(GetBannerEvent()),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(
            UploadImageUsecase(
              ProfileRepositoryImpl(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}
