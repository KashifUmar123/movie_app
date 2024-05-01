import 'package:get/get.dart';
import 'package:movieapp/features/home/presentation/home_controller.dart';
import 'package:movieapp/features/home/data/data_source/home_data_source.dart';
import 'package:movieapp/features/home/data/data_source/home_data_source_imp.dart';
import 'package:movieapp/features/home/domain/repositories/home_repository.dart';
import 'package:movieapp/features/home/data/repositories/home_repsitory_imp.dart';
import 'package:movieapp/features/home/domain/usecases/fetch_upcoming_movies_list.dart';
import 'package:movieapp/network/dio_wrapper.dart';
import 'package:movieapp/utils/pages/navigator.dart';
import 'package:movieapp/utils/servcies/firebase_remote_config_service.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeDataSource>(
      () => HomeDataSourceImp(
        dioWrapper: Get.find<DioWrapper>(),
      ),
    );

    Get.lazyPut<HomeRepository>(
      () => HomeRepositoryImp(
        Get.find<HomeDataSource>(),
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
        // aliceInspector: Get.find<Alice>(),
        remoteConfigService: Get.find<RemoteConfigService>(),
        fetchUpcomingMoviesUsecase: Get.find<FetchUpcomingMoviesUsecase>(),
      ),
    );
  }
}

class Alice {}
