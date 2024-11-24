import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:code_demonstration/domain/entity/search_product.dart';
import 'package:code_demonstration/domain/usecase/search_history/get_search_history_usecase.dart';
import 'package:code_demonstration/domain/usecase/search_history/save_product_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'views_history_event.dart';
part 'views_history_state.dart';

@injectable
class ViewsHistoryBloc extends Bloc<ViewsHistoryEvent, ViewsHistoryState> {
  final GetSearchHistoryUsecase _getSearchHistoryUsecase;
  final SaveProductUsecase _saveProductUsecase;
  ViewsHistoryBloc(this._getSearchHistoryUsecase, this._saveProductUsecase)
      : super(ViewsHistoryLoading()) {
    on<GetHistory>(_getHistory);
    on<SaveProduct>(_saveProduct);
  }

  FutureOr<void> _getHistory(GetHistory event, Emitter<ViewsHistoryState> emit) async {
    final result = await _getSearchHistoryUsecase();
    result.fold(
      (l) => emit(ViewsHistoryError()),
      (r) {
        if (state is ViewsHistoryReady) {
          emit(ViewsHistoryReady(productList: [...r]));
        } else {
          emit(ViewsHistoryReady(productList: r));
        }
      },
    );
  }

  FutureOr<void> _saveProduct(SaveProduct event, Emitter<ViewsHistoryState> state) async {
    await _saveProductUsecase(product: event.product);
    add(GetHistory());
  }
}
