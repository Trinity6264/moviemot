
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast.freezed.dart';
part 'cast.g.dart';

@freezed
class Cast with _$Cast {
  factory Cast({
    @Default("") String name,
    @JsonKey(name: "profile_path")
    @Default("") String profilePath,
  }) = _Cast;
	
  factory Cast.fromJson(Map<String, dynamic> json) =>
			_$CastFromJson(json);
}
