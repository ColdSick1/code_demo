import 'package:auto_route/auto_route.dart';
import 'package:code_demonstration/presentation/screens/search_screen/bloc/history_views_bloc/views_history_bloc.dart';
import 'package:code_demonstration/presentation/screens/search_screen/bloc/search_bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'search_screen_view.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  final String? searchQuery;
  const SearchScreen({this.searchQuery, super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GetIt.I<SearchBloc>()),
          BlocProvider(create: (context) => GetIt.I<ViewsHistoryBloc>()),
        ],
        child: SearchScreenView(searchQuery: searchQuery),
      );
}
