import 'dart:async';

import 'package:app_widya_edu/src/domain/usecases/get_banner_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/banner_model.dart';
import '../../../../data/repository/banner_repository_impl.dart';
import '../../../../domain/entities/banner_entity.dart';
import '../../../../domain/repositories/banner_repository.dart';

part 'banner_event.dart';
part 'banner_state.dart';

// class BannerBloc extends Bloc<BannerEvent, BannerState> {
//   final GetBannerUsecase getBannerUsecase;

//   BannerBloc(this.getBannerUsecase) : super(BannerInitial()) {
//     on<BannerEvent>((event, emit) async {
//       if (event is GetBannerEvent) {
//         emit(BannerLoading());
//         try {
//           final result = await getBannerUsecase();
//           emit(
//             BannerSuccess(
//               bannerList: result
//                   ?.map(
//                     (e) => BannerEntity(
//                         imgUrl: e.eventImage ?? '',
//                         redirecUrl: e.eventUrl ?? ''),
//                   )
//                   .toList(),
//             ),
//           );
//         } catch (e) {
//           emit(BannerError(errorMessage: 'pengambilan data gagal'));
//         }
//       }

//       // if (event is GetBannerEvent) {
//       //   emit(BannerLoading());
//       //   print("proses pengambilan data");
//       //   final result = await bannerRepository.getBannerList();
//       //   if (result == null) {
//       //     emit(BannerError(errorMessage: 'pengambilan data gagal'));
//       //   }
//       //   emit(
//       //     BannerSuccess(
//       //       bannerList: result
//       //           ?.map(
//       //             (e) => BannerEntity(
//       //                 imgUrl: e.eventImage ?? '', redirecUrl: e.eventUrl ?? ''),
//       //           )
//       //           .toList(),
//       //     ),
//       //   );
//       // }
//       // ;
//     });
//   }
// }

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final GetBannerUsecase getBannerUsecase;

  BannerBloc(this.getBannerUsecase) : super(BannerInitial()) {
    on<BannerEvent>((event, emit) async {
      if (event is GetBannerEvent) {
        emit(BannerLoading());
        final result = await getBannerUsecase();
        if (result == null) {
          emit(BannerError(errorMessage: 'gagal dalam pengambilan data'));
          return;
        }
        emit(
          BannerSuccess(
            bannerList: result
                .map(
                  (e) => BannerEntity(
                    imgUrl: e.eventImage ?? '',
                    redirecUrl: e.eventUrl ?? '',
                  ),
                )
                .toList(),
          ),
        );
      } else if (event is GetLatestBannerEvent) {
        print('GetLatestBannerEvent');
      }
    });
  }
}
