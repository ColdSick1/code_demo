part of '../search_screen_view.dart';

class SearchInitialView extends StatelessWidget {
  const SearchInitialView({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PopularRequest(),
            SpacerV(24),
            PreviousSearch(),
          ],
        ),
      );
}
