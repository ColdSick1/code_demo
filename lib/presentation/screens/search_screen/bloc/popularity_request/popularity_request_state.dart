part of 'popularity_request_bloc.dart';

sealed class PopularityRequestState {}

final class PopularityLoading extends PopularityRequestState {}

final class PopularityError extends PopularityRequestState {}

final class PopularityReady extends PopularityRequestState {
  final List<SearchTag> tagList;
  PopularityReady({required this.tagList});
}
