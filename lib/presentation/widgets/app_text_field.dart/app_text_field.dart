import 'package:code_demonstration/core/utils/typedefs.dart';
import 'package:code_demonstration/presentation/core/extensions/build_context_ext.dart';
import 'package:code_demonstration/presentation/core/theme/app_colors.dart';
import 'package:code_demonstration/presentation/widgets/spacer/spacerv.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String? labelText;
  final double? size;
  final double? height;
  final TextAlign textAlign;
  final String? hintText;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final VoidCallback? onSuffixTap;
  final StringCallback? onChangeValue;
  final VoidCallback? onEditingComplete;
  final TextEditingController? controller;
  final int? maxCharacter;
  final TextInputType? keyboardType;
  final double? labelPadding;
  final double? labelSize;

  const AppTextField({
    this.labelText,
    super.key,
    this.hintText,
    this.suffixWidget,
    this.prefixWidget,
    this.onSuffixTap,
    this.onChangeValue,
    this.onEditingComplete,
    this.controller,
    this.maxCharacter,
    this.keyboardType,
    this.size,
    this.height,
    this.textAlign = TextAlign.start,
    this.labelPadding = 12,
    this.labelSize = 14,
  }) : assert(
          !(size != null && height != null),
          'size и height не могут быть не null одновременно',
        );

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null)
            Padding(
              padding: (widget.textAlign == TextAlign.center)
                  ? EdgeInsets.zero
                  : EdgeInsets.only(left: widget.labelPadding!),
              child: Align(
                alignment: (widget.textAlign == TextAlign.center)
                    ? Alignment.center
                    : Alignment.centerLeft,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.labelText,
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                            fontSize: widget.labelSize,
                            color: context.theme.colorScheme.inversePrimary),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          const SpacerV(8),
          SizedBox(
            width: widget.size,
            height: widget.size ?? widget.height,
            child: TextFormField(
              controller: widget.controller,
              obscuringCharacter: '⦁',
              style: const TextStyle(
                fontSize: 14,
                height: 16.8 / 14,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
              onChanged: widget.onChangeValue,
              onEditingComplete: widget.onEditingComplete,
              keyboardType: widget.keyboardType,
              textAlign: widget.textAlign,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: context.theme.textTheme.bodyMedium?.copyWith(
                  color: context.theme.colorScheme.onSurfaceVariant.withOpacity(0.6),
                ),
                contentPadding: widget.size != null
                    ? EdgeInsets.zero
                    : const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.theme.colorScheme.onSurfaceVariant,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.theme.colorScheme.tertiaryContainer.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: context.theme.colorScheme.primary),
                  borderRadius: BorderRadius.circular(12),
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: context.theme.colorScheme.error,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: context.theme.colorScheme.error),
                ),
                suffixIcon: widget.suffixWidget,
                prefixIcon: widget.prefixWidget,
              ),
            ),
          ),
        ],
      );
}
