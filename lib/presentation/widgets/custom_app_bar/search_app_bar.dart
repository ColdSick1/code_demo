import 'dart:async';

import 'package:code_demonstration/core/utils/typedefs.dart';
import 'package:code_demonstration/gen/assets.gen.dart';
import 'package:code_demonstration/gen/translations.g.dart';
import 'package:code_demonstration/presentation/core/extensions/build_context_ext.dart';
import 'package:code_demonstration/presentation/core/theme/app_colors.dart';
import 'package:code_demonstration/presentation/screens/search_screen/bloc/search_bloc/search_bloc.dart';
import 'package:code_demonstration/presentation/widgets/app_text_field.dart/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CustomAppBar extends AppBar {
  CustomAppBar({super.key});

  factory CustomAppBar.searchScreenAppBar({required StringCallback onSearch}) =>
      _SearchScreenAppBar(
        onChangeTextField: onSearch,
      );
}

class _SearchScreenAppBar extends CustomAppBar {
  final StringCallback onChangeTextField;
  _SearchScreenAppBar({required this.onChangeTextField});

  @override
  State<_SearchScreenAppBar> createState() => _SearchScreenAppBarState();
}

class _SearchScreenAppBarState extends State<_SearchScreenAppBar> {
  final textController = TextEditingController();
  late final StreamSubscription<String> valueSubscription;

  @override
  void initState() {
    final bloc = context.read<SearchBloc>();
    valueSubscription = bloc.textFieldValue.listen(valueListener);
    super.initState();
  }

  void valueListener(String value) {
    textController.text = value;
    widget.onChangeTextField(textController.text);
  }

  Future<void> onBack(BuildContext context) async {
    context.router.maybePop(context);
  }

  void onDelete() {
    textController.clear();
    widget.onChangeTextField(textController.text);
  }

  Widget setDeleteIcon() => IconButton(
        onPressed: onDelete,
        icon: Assets.icons.search.cancel.svg(),
      );
  Widget setSearchIcon() => IconButton(
        onPressed: () {},
        icon: Assets.icons.search.search.svg(
          colorFilter: ColorFilter.mode(
            context.theme.colorScheme.inversePrimary,
            BlendMode.srcIn,
          ),
        ),
      );

  @override
  Future<void> dispose() async {
    valueSubscription.cancel();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AppBar(
        leading: IconButton(
          onPressed: () async => onBack(context),
          icon: Assets.icons.search.backButton.svg(),
        ),
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(left: 20),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AppTextField(
            height: 40,
            controller: textController,
            suffixWidget: setDeleteIcon(),
            prefixWidget: setSearchIcon(),
            hintText: t.search.searchInCatalog,
            maxCharacter: 100,
            onChangeValue: widget.onChangeTextField,
          ),
        ),
      );
}
