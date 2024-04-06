import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movieapp/network/dio_wrapper.dart';

// create a mock dio wrapper
class MockDioWrapper extends Mock implements DioWrapper {
  @override
  Future<Response> onGet(
      {required String api,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    return Response<dynamic>(
      requestOptions: RequestOptions(),
    );
  }
}

void main() {
  // group("Home repository", () {
  //   test("Testing fetching movies", () async {
  //     // init mock dio
  //     final mockDioWrapper = MockDioWrapper();
  //     // init repo
  //     HomeRepository homeRepository = HomeRepositoryImp(mockDioWrapper);
  //     // test the fectch movie
  //     when(mockDioWrapper.onGet(api: 'api')).thenAnswer((realInvocation) {
  //       return Future.value(Response(
  //         requestOptions: RequestOptions(),
  //         statusCode: 404,
  //       ));
  //     });
  //     dynamic result;
  //     try {
  //       result = await homeRepository.getMovies(UpcomingMoviesParams(page: 1));
  //     } catch (e) {
  //       result = e;
  //     }

  //     // verify(mockDioWrapper.onGet(api: 'api')).called(1);

  //     expect(result, ResourceNotFound("Resource not found"));
  //   });
  // });
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MovieApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
