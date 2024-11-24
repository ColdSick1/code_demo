part of 'search_bloc.dart';

sealed class SearchEvent {}

final class InitialSearchEvent extends SearchEvent {
  final String searchRequest;
  InitialSearchEvent({required this.searchRequest});
}

final class ReturnToInitialEvent extends SearchEvent {}

final class SearchPagination extends SearchEvent {
  final String searchRequest;
  final String? nextLink;

  SearchPagination({
    required this.searchRequest,
    this.nextLink,
  });
}
