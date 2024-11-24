part of 'search_bloc.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchError extends SearchState {
  final String errorMessage;
  final String lastSearch;
  SearchError(this.errorMessage, this.lastSearch);
}

final class SearchReady extends SearchState {
  final String searchRequest;
  final String? nextLink;
  final List<SearchProduct> models;
  SearchReady({
    required this.models,
    required this.searchRequest,
    this.nextLink,
  });
}
