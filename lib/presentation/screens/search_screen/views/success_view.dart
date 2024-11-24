part of '../search_screen_view.dart';

class _SuccessView extends StatelessWidget {
  const _SuccessView();

  Future<void> onTap(BuildContext context, SearchProduct product) async {
    context.read<ViewsHistoryBloc>().add(SaveProduct(product: product));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<SearchBloc>();
    final curState = bloc.state as SearchReady;
    if (curState.models.isEmpty) {
      return const _SearchEmptyView();
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: curState.models.length,
              itemBuilder: (_, index) => SearchProductCard(
                model: curState.models[index],
                onTap: () async => onTap(context, curState.models[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
