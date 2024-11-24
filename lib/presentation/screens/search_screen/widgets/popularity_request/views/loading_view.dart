part of '../popular_request.dart';

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.search.popularRequest,
            style: context.theme.textTheme.titleLarge,
          ),
          const SpacerV(24),
          const Wrap(
            runSpacing: 12,
            spacing: 16,
            children: [
              ShimmerTagCard(width: 60),
              ShimmerTagCard(width: 80),
              ShimmerTagCard(width: 100),
              ShimmerTagCard(width: 60),
              ShimmerTagCard(width: 125),
              ShimmerTagCard(width: 90),
              ShimmerTagCard(width: 120),
              ShimmerTagCard(width: 110),
              ShimmerTagCard(width: 90),
              ShimmerTagCard(),
            ],
          ),
        ],
      );
}
