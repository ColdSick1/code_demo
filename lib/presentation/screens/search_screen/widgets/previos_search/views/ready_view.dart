part of '../previos_search.dart';

class _ReadyView extends StatelessWidget {
  const _ReadyView();

  Future<void> onTap(BuildContext context, SearchProduct product) async {}

  @override
  Widget build(BuildContext context) {
    final curState = context.watch<ViewsHistoryBloc>().state as ViewsHistoryReady;
    if (curState.productList.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.search.previosSearch,
          style: context.theme.textTheme.titleLarge,
        ),
        const SpacerV(16),
        ListView.separated(
          primary: false,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: curState.productList.length,
          itemBuilder: (_, index) => SearchProductCard(
            model: curState.productList[index],
            onTap: () async => onTap(context, curState.productList[index]),
          ),
          separatorBuilder: (_, __) => const SpacerV(16),
        ),
      ],
    );
  }
}
