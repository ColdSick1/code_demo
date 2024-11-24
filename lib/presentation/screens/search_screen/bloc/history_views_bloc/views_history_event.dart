part of 'views_history_bloc.dart';

sealed class ViewsHistoryEvent {}

final class GetHistory extends ViewsHistoryEvent {}

final class SaveProduct extends ViewsHistoryEvent {
  final SearchProduct product;
  SaveProduct({required this.product});
}
