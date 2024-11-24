part of '../search_screen_view.dart';

class _SearchEmptyView extends StatelessWidget {
  const _SearchEmptyView();

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.search.sad.svg(),
            const SpacerV(16),
            Text(
              t.search.emptyPage,
              style: context.theme.textTheme.bodyLarge,
            ),
            const SpacerV(16),
            Text(
              t.search.tryAgain,
              style: context.theme.textTheme.bodyMedium,
            ),
            const SpacerV(100),
          ],
        ),
      );
}
