import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:code_demonstration/domain/entity/search_product.dart';
import 'package:code_demonstration/domain/usecase/search/search_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUsecase _usecase;
  SearchBloc(this._usecase) : super(SearchInitial()) {
    on<InitialSearchEvent>(_search);
    on<SearchPagination>(_pagination);
    on<ReturnToInitialEvent>(_return);
  }

  final textFieldValue = BehaviorSubject<String>();
  bool isPagination = false;
  Timer? debounce;

  void textFieldOnChange(String searchRequest) {
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 500), () {
      if (searchRequest.isNotEmpty) {
        add(InitialSearchEvent(searchRequest: searchRequest.toLowerCase()));
      } else {
        add(ReturnToInitialEvent());
      }
    });
  }

  FutureOr<void> _search(InitialSearchEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    final result = await _usecase(searchRequest: event.searchRequest);
    result.fold(
      (l) => emit(SearchError(l.message, event.searchRequest)),
      (r) {
        emit(
          SearchReady(
            models: r,
            searchRequest: event.searchRequest,
          ),
        );
      },
    );
  }

  FutureOr<void> _return(ReturnToInitialEvent event, Emitter<SearchState> emit) {
    emit(SearchInitial());
  }

  void runPagination({String? nextLink}) {
    if (state is! SearchReady) return;
    if (isPagination) return;
    if (nextLink == null) return;
    final curState = state as SearchReady;
    add(
      SearchPagination(
        nextLink: nextLink,
        searchRequest: curState.searchRequest,
      ),
    );
  }

  FutureOr<void> _pagination(SearchPagination event, Emitter<SearchState> emit) async {
    final curState = state as SearchReady;
    final result = await _usecase(
      searchRequest: event.searchRequest,
    );
    result.fold(
      (l) {},
      (r) {
        final newItemList = curState.models;
        newItemList.addAll(r);
        emit(
          SearchReady(
            models: newItemList,
            searchRequest: curState.searchRequest,
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    textFieldValue.close();
    return super.close();
  }
}
