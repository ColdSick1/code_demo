part of 'views_history_bloc.dart';

sealed class ViewsHistoryState extends Equatable {}

final class ViewsHistoryLoading extends ViewsHistoryState {
  @override
  List<Object?> get props => [];
}

final class ViewsHistoryReady extends ViewsHistoryState {
  final List<SearchProduct> productList;
  ViewsHistoryReady({required this.productList});

  @override
  List<Object?> get props => [productList];
}

final class ViewsHistoryError extends ViewsHistoryState {
  @override
  List<Object?> get props => [];
}
