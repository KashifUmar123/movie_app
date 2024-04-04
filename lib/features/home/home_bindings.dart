import 'package:get/get.dart';
import 'package:movieapp/features/home/home_controller.dart';
import 'package:movieapp/features/home/repositroy/home_repository.dart';
import 'package:movieapp/features/home/repositroy/home_repsitory_imp.dart';
import 'package:movieapp/features/home/usecases/fetch_upcoming_movies_list.dart';
import 'package:movieapp/network/dio_wrapper.dart';
import 'package:movieapp/utils/pages/navigator.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(
      () => HomeRepositoryImp(
        Get.find<DioWrapper>(),
      ),
    );

    Get.lazyPut<FetchUpcomingMoviesUsecase>(
      () => FetchUpcomingMoviesUsecase(
        homeRepository: Get.find<HomeRepository>(),
      ),
    );

    Get.put(
      HomeController(
        iNavigator: Get.find<INavigator>(),
        fetchUpcomingMoviesUsecase: Get.find<FetchUpcomingMoviesUsecase>(),
      ),
    );
  }
}
