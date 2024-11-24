part of '../previos_search.dart';

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.search.previosSearch,
            style: context.theme.textTheme.titleLarge,
          ),
          const SpacerV(16),
          const SearchShimmerCard(),
          const SpacerV(16),
          const SearchShimmerCard(),
          const SpacerV(16),
          const SearchShimmerCard(),
          const SpacerV(16),
          const SearchShimmerCard(),
          const SpacerV(16),
          const SearchShimmerCard(),
          const SpacerV(16),
        ],
      );
}
