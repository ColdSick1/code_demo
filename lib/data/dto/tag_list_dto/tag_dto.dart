import 'package:code_demonstration/domain/entity/search_tag.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag_dto.g.dart';

@JsonSerializable()
class SearchTagDto {
  final String query;

  const SearchTagDto({required this.query});

  factory SearchTagDto.fromJson(Map<String, dynamic> json) => _$SearchTagDtoFromJson(json);

  SearchTag toEntity() => SearchTag(title: query);

  static List<SearchTag> fromList(List<dynamic> listJson) =>
      listJson.map((e) => SearchTagDto.fromJson(e as Map<String, dynamic>).toEntity()).toList();
}
