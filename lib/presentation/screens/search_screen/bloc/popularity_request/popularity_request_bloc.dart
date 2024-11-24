import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:code_demonstration/domain/entity/search_tag.dart';
import 'package:code_demonstration/domain/usecase/popularity_tag/popularity_tag_usecase.dart';
import 'package:injectable/injectable.dart';

part 'popularity_request_event.dart';
part 'popularity_request_state.dart';

@injectable
class PopularityRequestBloc extends Bloc<PopularityRequestEvent, PopularityRequestState> {
  final PopularityTagUsecase _usecase;
  PopularityRequestBloc(this._usecase) : super(PopularityLoading()) {
    on<InitPopularRequest>(_getTags);
  }

  FutureOr<void> _getTags(InitPopularRequest event, Emitter<PopularityRequestState> emit) async {
    final result = await _usecase();

    result.fold(
      (l) => emit(PopularityError()),
      (r) => emit(PopularityReady(tagList: r)),
    );
  }
}
