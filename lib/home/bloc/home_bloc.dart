import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moviemot/movie/models/cast/cast.dart';
import 'package:moviemot/movie/models/movie/movie.dart';
import 'package:moviemot/movie/models/movie_video/movie_video.dart';
import 'package:moviemot/movie/repository/movie_repository.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required MovieRepository movieRepository,
  })  : _movieRepository = movieRepository,
        super(const HomeState()) {
    on<_FetchedPopularMovies>(_onFetchedPopularMovies);
    on<_FetchedFreeMovies>(_onFetchedFreeMovies);
    on<_FetchedData>(_onFetchedData);
    on<_MovieSelected>(_onMovieSelected);
    on<_FetchedCast>(_onFetchedCast);
    on<_FetchedVideo>(_onFetchedVideo);
  }

  final MovieRepository _movieRepository;

  void _onMovieSelected(
    _MovieSelected event,
    Emitter<HomeState> emit,
  ) async {
    add(_FetchedCast(id: event.movie.id));
    add(_FetchedVideo(id: event.movie.id));
    emit(state.copyWith(selectedMovie: Some(event.movie)));
  }

  void _onFetchedData(
    _FetchedData event,
    Emitter<HomeState> emit,
  ) {
    add(const _FetchedPopularMovies());
    add(const _FetchedFreeMovies());
  }

  Future<void> _onFetchedPopularMovies(
    _FetchedPopularMovies event,
    Emitter<HomeState> emit,
  ) async {
    final results = await _movieRepository.getPopularMovies.run();
    return results.fold(
      (error) {
        log(error);

        emit(
          state.copyWith(
            isPopularMoviesLoading: false,
            popularMovie: [],
          ),
        );
      },
      (movies) {
        emit(
          state.copyWith(
            isPopularMoviesLoading: false,
            popularMovie: movies,
          ),
        );
      },
    );
  }

  Future<void> _onFetchedFreeMovies(
    _FetchedFreeMovies event,
    Emitter<HomeState> emit,
  ) async {
    final results = await _movieRepository.getTopRatedMovies.run();
    return results.fold(
      (error) {
        log(error);

        emit(
          state.copyWith(
            isFreeMoviesLoading: false,
            freeMovie: [],
          ),
        );
      },
      (freeMovies) {
        emit(
          state.copyWith(
            isFreeMoviesLoading: false,
            freeMovie: freeMovies,
          ),
        );
      },
    );
  }

  Future<void> _onFetchedCast(
    _FetchedCast event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(casts: [], isCastLoading: true),
    );
    final results = await _movieRepository.getCast(id: event.id).run();
    return results.fold(
      (error) {
        log(error);

        emit(
          state.copyWith(
            isCastLoading: false,
            casts: [],
          ),
        );
      },
      (casts) {
        emit(
          state.copyWith(
            isCastLoading: false,
            casts: casts,
          ),
        );
      },
    );
  }
  Future<void> _onFetchedVideo(
    _FetchedVideo event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(casts: [], isVideoLoading: true),
    );
    final results = await _movieRepository.getVideos(id: event.id).run();
    return results.fold(
      (error) {
        log(error);

        emit(
          state.copyWith(
            isVideoLoading: false,
            videos: [],
          ),
        );
      },
      (videos) {
        emit(
          state.copyWith(
            isVideoLoading: false,
            videos: videos,
          ),
        );
      },
    );
  }
}
