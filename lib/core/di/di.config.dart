// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:code_demonstration/core/service/cache/cache_hive_client.dart'
    as _i175;
import 'package:code_demonstration/core/service/http/base_http.dart' as _i255;
import 'package:code_demonstration/core/service/http/http_client.dart' as _i36;
import 'package:code_demonstration/data/api/search_api.dart' as _i834;
import 'package:code_demonstration/data/cache/products_history/cache_product-search_history.dart'
    as _i1057;
import 'package:code_demonstration/data/repository/search_history_repository_impl.dart'
    as _i404;
import 'package:code_demonstration/data/repository/search_repository_impl.dart'
    as _i1041;
import 'package:code_demonstration/domain/repository/search_history_repository.dart'
    as _i478;
import 'package:code_demonstration/domain/repository/search_repository.dart'
    as _i867;
import 'package:code_demonstration/domain/service/cache/cache_client.dart'
    as _i317;
import 'package:code_demonstration/domain/service/cache/products_history/products_history_cache.dart'
    as _i939;
import 'package:code_demonstration/domain/usecase/popularity_tag/popularity_tag_usecase.dart'
    as _i594;
import 'package:code_demonstration/domain/usecase/search/search_usecase.dart'
    as _i420;
import 'package:code_demonstration/domain/usecase/search_history/get_search_history_usecase.dart'
    as _i450;
import 'package:code_demonstration/domain/usecase/search_history/save_product_usecase.dart'
    as _i743;
import 'package:code_demonstration/presentation/screens/search_screen/bloc/history_views_bloc/views_history_bloc.dart'
    as _i499;
import 'package:code_demonstration/presentation/screens/search_screen/bloc/popularity_request/popularity_request_bloc.dart'
    as _i645;
import 'package:code_demonstration/presentation/screens/search_screen/bloc/search_bloc/search_bloc.dart'
    as _i265;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i317.CacheClient>(() => _i175.MobileHiveCacheClient());
    gh.singleton<_i255.BaseHttp>(() => _i36.HttpClient());
    gh.factory<_i939.CacheProductHistoryManager>(
        () => _i1057.CacheProductHistoryManagerImpl(gh<_i317.CacheClient>()));
    gh.factory<_i478.SearchHistoryRepository>(() =>
        _i404.SearchHistoryRepositoryImpl(
            gh<_i939.CacheProductHistoryManager>()));
    gh.factory<_i450.GetSearchHistoryUsecase>(() =>
        _i450.GetSearchHistoryUsecase(gh<_i478.SearchHistoryRepository>()));
    gh.factory<_i743.SaveProductUsecase>(
        () => _i743.SaveProductUsecase(gh<_i478.SearchHistoryRepository>()));
    gh.factory<_i834.SearchApi>(() => _i834.SearchApi(gh<_i255.BaseHttp>()));
    gh.factory<_i499.ViewsHistoryBloc>(() => _i499.ViewsHistoryBloc(
          gh<_i450.GetSearchHistoryUsecase>(),
          gh<_i743.SaveProductUsecase>(),
        ));
    gh.factory<_i867.SearchRepository>(
        () => _i1041.SearchRepositoryImpl(gh<_i834.SearchApi>()));
    gh.factory<_i420.SearchUsecase>(
        () => _i420.SearchUsecase(gh<_i867.SearchRepository>()));
    gh.factory<_i594.PopularityTagUsecase>(
        () => _i594.PopularityTagUsecase(gh<_i867.SearchRepository>()));
    gh.factory<_i645.PopularityRequestBloc>(
        () => _i645.PopularityRequestBloc(gh<_i594.PopularityTagUsecase>()));
    gh.factory<_i265.SearchBloc>(
        () => _i265.SearchBloc(gh<_i420.SearchUsecase>()));
    return this;
  }
}
