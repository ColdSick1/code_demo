import 'package:code_demonstration/gen/translations.g.dart';
import 'package:code_demonstration/presentation/core/extensions/build_context_ext.dart';
import 'package:code_demonstration/presentation/screens/search_screen/bloc/popularity_request/popularity_request_bloc.dart';
import 'package:code_demonstration/presentation/screens/search_screen/bloc/search_bloc/search_bloc.dart';
import 'package:code_demonstration/presentation/screens/search_screen/widgets/popularity_request/shimmer_tag_card.dart';
import 'package:code_demonstration/presentation/screens/search_screen/widgets/search_tag.dart';
import 'package:code_demonstration/presentation/widgets/spacer/spacerv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'views/loading_view.dart';
part 'views/ready_view.dart';

class PopularRequest extends StatelessWidget {
  const PopularRequest({
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocBuilder<PopularityRequestBloc, PopularityRequestState>(
        builder: (context, state) => switch (state) {
          PopularityReady() => const _ReadyView(),
          PopularityError() => const SizedBox.shrink(),
          PopularityLoading() => const _LoadingView(),
        },
      );
}
