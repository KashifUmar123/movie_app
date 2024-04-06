import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movieapp/features/home/data/upcoming_movies_params.dart';
import 'package:movieapp/features/home/repositroy/home_repository.dart';
import 'package:movieapp/features/home/repositroy/home_repsitory_imp.dart';
import 'package:movieapp/models/upcoming_movies_model.dart';
import 'package:movieapp/network/dio_wrapper.dart';
import 'package:movieapp/network/exceptions/netwrok_exceptions.dart';

// create a mock dio wrapper
class MockDioWrapper extends Mock implements DioWrapper {
  @override
  Future<Response> onGet(
      {required String api,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    return Response(
      requestOptions: RequestOptions(),
      statusCode: 200,
      data: mockResponse,
    );
  }
}

Map<String, dynamic> mockResponse = {
  "dates": {"maximum": "2024-05-01", "minimum": "2024-04-10"},
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/sR0SpCrXamlIkYMdfz83sFn5JS6.jpg",
      "genre_ids": [28, 878, 12],
      "id": 823464,
      "original_language": "en",
      "original_title": "Godzilla x Kong: The New Empire",
      "overview":
          "Following their explosive showdown, Godzilla and Kong must reunite against a colossal undiscovered threat hidden within our world, challenging their very existence – and our own.",
      "popularity": 3404.57,
      "poster_path": "/4Hbf0Gw5PD2GC7PmiwjEwf0ROCU.jpg",
      "release_date": "2024-03-27",
      "title": "Godzilla x Kong: The New Empire",
      "video": false,
      "vote_average": 6.7,
      "vote_count": 431
    },
    {
      "adult": false,
      "backdrop_path": "/1XDDXPXGiI8id7MrUxK36ke7gkX.jpg",
      "genre_ids": [28, 12, 16, 35, 10751],
      "id": 1011985,
      "original_language": "en",
      "original_title": "Kung Fu Panda 4",
      "overview":
          "Po is gearing up to become the spiritual leader of his Valley of Peace, but also needs someone to take his place as Dragon Warrior. As such, he will train a new kung fu practitioner for the spot and will encounter a villain called the Chameleon who conjures villains from the past.",
      "popularity": 2101.694,
      "poster_path": "/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg",
      "release_date": "2024-03-02",
      "title": "Kung Fu Panda 4",
      "video": false,
      "vote_average": 6.753,
      "vote_count": 605
    },
  ],
  "total_pages": 54,
  "total_results": 1063
};

void main() {
  late HomeRepository homeRepository;
  late MockDioWrapper mockDioWrapper;

  setUp(() {
    mockDioWrapper = MockDioWrapper();
    homeRepository = HomeRepositoryImp(mockDioWrapper);
  });

  test("Test should be pass for Dio get", () async {
    UpcomingMoviesParams params = UpcomingMoviesParams(page: 1);
    String path = "/movies";

    when(mockDioWrapper.onGet(api: path)).thenAnswer(
      (_) => Future.value(
        Response(
          requestOptions: RequestOptions(),
          statusCode: 200,
          data: mockResponse,
        ),
      ),
    );

    // Call the home repo
    dynamic result;
    try {
      result = await homeRepository.getMovies(params);
    } catch (e) {
      expect(result, isA<Right<Failure, UpcomingMovies>>());
      var left = result as Left;
      expect(left, Failure);
    }

    expect(result, isA<Right<Failure, UpcomingMovies>>());
    final right = result as Right;
    expect(right.value.movies.length,
        equals(2)); // Check if 2 movies are parsed (based on your mock data)
  });
}
