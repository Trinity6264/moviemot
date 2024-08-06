
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_video.freezed.dart';
part 'movie_video.g.dart';

@freezed
class MovieVideo with _$MovieVideo {
  factory MovieVideo({
    required String id,
    required String key,
    required String name,
    required String site,
    required int size,
    required String type,
  }) = _MovieVideo;
	
  factory MovieVideo.fromJson(Map<String, dynamic> json) =>
			_$MovieVideoFromJson(json);
}
