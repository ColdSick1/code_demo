import 'package:code_demonstration/domain/entity/search_product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_result_dto.g.dart';

@JsonSerializable()
class SearchResultDto {
  final int id;
  final String name;
  final String image;

  SearchResultDto({
    required this.id,
    required this.name,
    required this.image,
  });

  factory SearchResultDto.fromJson(Map<String, dynamic> json) => _$SearchResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultDtoToJson(this);

  static SearchProduct toEntity(SearchResultDto dto) => SearchProduct(
        id: dto.id,
        image: dto.image,
        name: dto.name,
      );

  static List<SearchProduct> fromList(List<dynamic> listJson) {
    final entityList = <SearchProduct>[];
    for (final element in listJson) {
      entityList
          .add(SearchResultDto.toEntity(SearchResultDto.fromJson(element as Map<String, dynamic>)));
    }
    return entityList;
  }
}
