import 'package:app_widya_edu/src/data/data_source/auth_data_source.dart';
import 'package:app_widya_edu/src/data/repository/auth_repository_impl.dart';
import 'package:app_widya_edu/src/domain/repositories/auth_repository.dart';
import 'package:app_widya_edu/src/domain/usecases/is_registed_usecase.dart';
import 'package:app_widya_edu/src/domain/usecases/is_signed_in_with_google_usecase.dart';
import 'package:app_widya_edu/src/domain/usecases/register_usecase.dart';
import 'package:app_widya_edu/src/presentation/manager/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_source/banner_data_source.dart';
import '../../data/data_source/course_data_source.dart';
import '../../data/repository/banner_repository_impl.dart';
import '../../data/repository/course_repository_impl.dart';
import '../../domain/usecases/get_banner_usecase.dart';
import '../../domain/usecases/get_course_usecase.dart';
import '../../domain/usecases/sign_in_with_google_usecase.dart';
import 'banner/bloc/banner_bloc.dart';
import 'course/course_bloc.dart';

late final CourseDataSource? courceDataSource;
late final CourseRepositoryImpl? courseRepositoryImpl;
List<BlocProvider> blocProviders = [
  BlocProvider(
    create: (context) {
      final authDataSource = AuthDataSource();
      AuthRepository authRepository = AuthRepositoryImpl(authDataSource);
      return AuthBloc(
        IsSignedWithGoogleInUsecase(authRepository),
        SignInWithGoogleUsecase(authRepository),
        IsRegistedUsecase(authRepository),
        RegisterUsecase(authRepository),
      );
    },
  ),
  // BlocProvider<BannerBloc>(
  //   create: (context) => BannerBloc(
  //     GetBannerUsecase(
  //       BannerRepositoryImpl(
  //         BannerDataSource(),
  //       ),
  //     ),
  //   )..add(GetBannerEvent()),
  // ),
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
];
