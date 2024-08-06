import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:moviemot/movie/models/cast/cast.dart';
import 'package:moviemot/movie/models/movie/movie.dart';
import 'package:moviemot/movie/models/movie_video/movie_video.dart';
import 'package:moviemot/utils/api_client.dart';
import 'package:moviemot/utils/constant.dart';

class MovieRepository {
  const MovieRepository();

  static final _apiClient = ApiClient();

  // Get all popular movies
  TaskEither<String, List<Movie>> get getPopularMovies {
    return TaskEither.tryCatch(
      () async {
        final results = await _apiClient.get(
          path: Constant.popularMovie,
          queryParameters: {
            "language": "en-US",
            "page": "1",
            "sort_by": "popularity.desc",
          },
        );
        if (results.statusCode == 200) {
          final List<Movie> movies = (results.data['results'] as List)
              .map((e) => Movie.fromJson(e))
              .toList();
          return movies;
        } else {
          return [];
        }
      },
      (error, stackTrace) {
        log(error.toString(), stackTrace: stackTrace);
        return error.toString();
      },
    );
  }

  TaskEither<String, List<Movie>> get getTopRatedMovies {
    return TaskEither.tryCatch(
      () async {
        final results = await _apiClient.get(
          path: Constant.topRatedMovie,
          queryParameters: {
            "language": "en-US",
            "page": "1",
            "sort_by": "popularity.desc",
          },
        );
        if (results.statusCode == 200) {
          final List<Movie> movies = (results.data['results'] as List)
              .map((e) => Movie.fromJson(e))
              .toList();
          return movies;
        } else {
          return [];
        }
      },
      (error, stackTrace) {
        log(error.toString(), stackTrace: stackTrace);
        return error.toString();
      },
    );
  }

  TaskEither<String, List<Cast>> getCast({
    required int id,
  }) {
    return TaskEither.tryCatch(
      () async {
        final results = await _apiClient.get(
          path: '/movie/$id/credits',
          queryParameters: {
            "language": "en-US",
          },
        );
        if (results.statusCode == 200) {
          final List<Cast> casts = (results.data['cast'] as List)
              .map((e) => Cast.fromJson(e))
              .toList();
          return casts;
        } else {
          return [];
        }
      },
      (error, stackTrace) {
        log(error.toString(), stackTrace: stackTrace);
        return error.toString();
      },
    );
  }

  TaskEither<String, List<MovieVideo>> getVideos({
    required int id,
  }) {
    return TaskEither.tryCatch(
      () async {
        final results = await _apiClient.get(
          path: '/movie/$id/videos',
          queryParameters: {
            "language": "en-US",
          },
        );
        if (results.statusCode == 200) {
          final List<MovieVideo> videos = (results.data['results'] as List)
              .map((e) => MovieVideo.fromJson(e))
              .toList();

          return videos;
        } else {
          return [];
        }
      },
      (error, stackTrace) {
        log(error.toString(), stackTrace: stackTrace);
        return error.toString();
      },
    );
  }
}
