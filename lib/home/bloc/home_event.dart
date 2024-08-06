part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchedData() = _FetchedData;
  const factory HomeEvent.fetchedPopularMovies() = _FetchedPopularMovies;
  const factory HomeEvent.fetchedFreeMovies() = _FetchedFreeMovies;

  const factory HomeEvent.movieSelected({
    required Movie movie,
  }) = _MovieSelected;

  const factory HomeEvent.fetchedMovieDetails({
    required int id,
  }) = _FetchedMovieDetails;

  const factory HomeEvent.fetchedCast({
    required int id,
  }) = _FetchedCast;

  const factory HomeEvent.fetchedVideo({
    required int id,
  }) = _FetchedVideo;
}
