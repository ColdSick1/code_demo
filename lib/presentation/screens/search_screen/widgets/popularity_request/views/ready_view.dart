part of '../popular_request.dart';

class _ReadyView extends StatelessWidget {
  const _ReadyView();

  void onTagTap(BuildContext context, String searchRequestValue) {
    context.read<SearchBloc>().textFieldValue.add(searchRequestValue);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<PopularityRequestBloc>();
    final curState = bloc.state as PopularityReady;
    if (curState.tagList.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.search.popularRequest,
          style: context.theme.textTheme.titleLarge,
        ),
        const SpacerV(24),
        Wrap(
          runSpacing: 12,
          spacing: 16,
          children: [
            ...curState.tagList.map(
              (e) => SearchTag(
                title: e.title,
                onTap: () => onTagTap(context, e.title),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
