import 'package:code_demonstration/data/api/search_api.dart';
import 'package:code_demonstration/data/dto/search_result_dto/search_result_dto.dart';
import 'package:code_demonstration/data/dto/tag_list_dto/tag_dto.dart';
import 'package:code_demonstration/domain/core/failure/failure.dart';
import 'package:code_demonstration/domain/core/failure/parsing_failure.dart';
import 'package:code_demonstration/domain/entity/search_product.dart';
import 'package:code_demonstration/domain/entity/search_tag.dart';
import 'package:code_demonstration/domain/repository/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  final SearchApi _api;
  SearchRepositoryImpl(this._api);

  @override
  Future<Either<Failure, List<SearchProduct>>> search({
    required String searchRequest,
    String? nextLink,
  }) async {
    final result = await _api.search(
      searchRequest: searchRequest,
      nextLink: nextLink,
    );
    return result.fold(
      Left.new,
      (r) {
        try {
          final response = r["results"] as List<dynamic>;
          final entityList = SearchResultDto.fromList(response);

          return Right(entityList);
        } catch (err) {
          return Left(FailureParsing(err.toString()));
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<SearchTag>>> getTags() async {
    final result = await _api.getTags();

    return result.fold(
      Left.new,
      (r) {
        final entityList = SearchTagDto.fromList(r as List<dynamic>);
        return Right(entityList);
      },
    );
  }
}
