import 'package:code_demonstration/domain/entity/search_product.dart';
import 'package:code_demonstration/gen/assets.gen.dart';
import 'package:code_demonstration/gen/translations.g.dart';
import 'package:code_demonstration/presentation/core/extensions/build_context_ext.dart';
import 'package:code_demonstration/presentation/screens/search_screen/bloc/history_views_bloc/views_history_bloc.dart';
import 'package:code_demonstration/presentation/screens/search_screen/bloc/popularity_request/popularity_request_bloc.dart';
import 'package:code_demonstration/presentation/screens/search_screen/bloc/search_bloc/search_bloc.dart';
import 'package:code_demonstration/presentation/widgets/custom_app_bar/search_app_bar.dart';
import 'package:code_demonstration/presentation/widgets/search_product_card/search_product_card.dart';
import 'package:code_demonstration/presentation/widgets/spacer/spacerv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'widgets/popularity_request/popular_request.dart';
import 'widgets/previos_search/previos_search.dart';

part 'views/search_empty_view.dart';
part 'views/search_error_view.dart';
part 'views/search_initial_view.dart';
part 'views/success_view.dart';
part 'views/search_loading_view.dart';

class SearchScreenView extends StatefulWidget {
  final String? searchQuery;
  SearchScreenView({this.searchQuery, super.key});

  @override
  State<SearchScreenView> createState() => _SearchScreenViewState();
}

class _SearchScreenViewState extends State<SearchScreenView> {
  late SearchBloc bloc;

  void search(String searchRequest) {
    bloc.textFieldOnChange(searchRequest);
  }

  @override
  void initState() {
    if (widget.searchQuery != null && widget.searchQuery!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => search(widget.searchQuery!),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bloc = context.read<SearchBloc>();
    return Scaffold(
      backgroundColor: context.theme.colorScheme.tertiary,
      appBar: CustomAppBar.searchScreenAppBar(onSearch: search),
      body: BlocBuilder<SearchBloc, SearchState>(
        bloc: bloc,
        builder: (context, state) => switch (state) {
          SearchReady() => const _SuccessView(),
          SearchError() => const _ErrorView(),
          SearchLoading() => const _LoadingView(),
          SearchInitial() => BlocProvider(
              create: (context) => GetIt.I<PopularityRequestBloc>()
                ..add(
                  InitPopularRequest(),
                ),
              child: const SearchInitialView(),
            ),
        },
      ),
    );
  }
}
