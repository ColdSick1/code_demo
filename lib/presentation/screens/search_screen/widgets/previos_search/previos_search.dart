import 'package:code_demonstration/domain/entity/search_product.dart';
import 'package:code_demonstration/gen/translations.g.dart';
import 'package:code_demonstration/presentation/core/extensions/build_context_ext.dart';
import 'package:code_demonstration/presentation/screens/search_screen/bloc/history_views_bloc/views_history_bloc.dart';
import 'package:code_demonstration/presentation/screens/search_screen/widgets/previos_search/search_shimmer_card.dart';
import 'package:code_demonstration/presentation/widgets/search_product_card/search_product_card.dart';
import 'package:code_demonstration/presentation/widgets/spacer/spacerv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'views/loader_view.dart';
part 'views/ready_view.dart';

class PreviousSearch extends StatelessWidget {
  const PreviousSearch({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<ViewsHistoryBloc, ViewsHistoryState>(
        bloc: context.read<ViewsHistoryBloc>()..add(GetHistory()),
        builder: (context, state) => switch (state) {
          ViewsHistoryReady() => const _ReadyView(),
          ViewsHistoryError() => const SizedBox.shrink(),
          ViewsHistoryLoading() => const _LoadingView(),
        },
      );
}
