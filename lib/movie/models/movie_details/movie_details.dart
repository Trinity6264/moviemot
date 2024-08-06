
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moviemot/movie/genres/genres.dart';

part 'movie_details.freezed.dart';
part 'movie_details.g.dart';

@freezed
class MovieDetails with _$MovieDetails {
  factory MovieDetails({
    required bool adult,
    required int budget,
    required List<Genres> genres,
    required String homepage,
    required int id,
    @JsonKey(name: 'imdb_id') required String imdbId,
    @JsonKey(name: 'original_language') required String originalLanguage,
    @JsonKey(name: 'original_title') required String originalTitle,
    required String overview,
    required double popularity,
    @JsonKey(name: 'poster_path') required String posterPath,
    @JsonKey(name: 'production_companies') required List<dynamic> productionCompanies,
    @JsonKey(name: 'production_countries') required List<dynamic> productionCountries,
    @JsonKey(name: 'release_date') required String releaseDate,
    required int revenue,
    required int runtime,
    @JsonKey(name: 'spoken_languages') required List<dynamic> spokenLanguages,
    required String status,
    required String tagline,
    required String title,
    required bool video,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
  }) = _MovieDetails;
	
  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
			_$MovieDetailsFromJson(json);
}
