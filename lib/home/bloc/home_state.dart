part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Movie> popularMovie,
    @Default([]) List<Movie> freeMovie,

    @Default([]) List<Cast> casts,
    @Default([]) List<MovieVideo> videos,
    
    @Default(Option.none()) Option<Movie> selectedMovie,

    @Default(true) bool isCastLoading,
    @Default(true) bool isVideoLoading,
    @Default(true) bool isPopularMoviesLoading,
    @Default(true) bool isFreeMoviesLoading,

  }) = _HomeState;
}
