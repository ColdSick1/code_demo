part of '../search_screen_view.dart';

class _ErrorView extends StatelessWidget {
  const _ErrorView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Placeholder()),
      ),
    );
  }
}
