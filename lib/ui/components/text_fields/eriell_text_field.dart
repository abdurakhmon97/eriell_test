import 'package:eriell/gen/colors.gen.dart';
import 'package:eriell/ui/themes/app_style.dart';
import 'package:flutter/material.dart';

class EriellTextField extends StatefulWidget {
  final String? error;
  final String? hintText;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;

  const EriellTextField({
    Key? key,
    this.textInputAction = TextInputAction.done,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.error,
    this.onChanged,
  }) : super(key: key);

  @override
  State<EriellTextField> createState() => _EriellTextFieldState();
}

class _EriellTextFieldState extends State<EriellTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: widget.textInputAction,
      onChanged: (v) {
        if (v.isNotEmpty) {
          setState(() {});
        }
        widget.onChanged?.call(v);
      },
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorName.white,
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            color: ColorName.red,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            color: ColorName.red,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            color: ColorName.red,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: ColorName.gray2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: ColorName.darkBlue),
        ),
        errorText: widget.error,
        hintText: widget.hintText,
        hintStyle: AppStyle.interW500x14Grey,
        prefixStyle: AppStyle.interW500x16White70,
        contentPadding: const EdgeInsets.only(
          left: 24,
          top: 18,
          bottom: 18,
          right: 12,
        ),
        errorStyle: AppStyle.header7.copyWith(color: ColorName.red),
      ),
    );
  }
}
