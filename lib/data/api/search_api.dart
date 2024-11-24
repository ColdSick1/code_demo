import 'package:code_demonstration/core/service/http/base_http.dart';
import 'package:code_demonstration/core/utils/typedefs.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchApi {
  final BaseHttp _httpClient;

  SearchApi(this._httpClient);

  ApiRequest search({required String searchRequest, String? nextLink}) async => _httpClient.get(
        uri: 'character',
        queryParameters: {
          "name": searchRequest,
        },
      );

  ApiRequest getTags() async => const Right(<dynamic>[
        {'query': 'rick'},
        {'query': 'morty'},
        {'query': 'rick'},
        {'query': 'morty'},
      ]);
}
