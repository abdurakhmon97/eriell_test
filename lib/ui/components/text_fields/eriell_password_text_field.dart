import 'package:eriell/gen/assets.gen.dart';
import 'package:eriell/gen/colors.gen.dart';
import 'package:eriell/ui/themes/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EriellPasswordTextField extends StatefulWidget {
  final String hintText;
  final String? error;
  final List<TextInputFormatter>? formatter;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const EriellPasswordTextField({
    Key? key,
    this.formatter,
    this.textInputAction = TextInputAction.done,
    this.hintText = '',
    this.error,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  State<EriellPasswordTextField> createState() => _PasswordTextFieldFieldState();
}

class _PasswordTextFieldFieldState extends State<EriellPasswordTextField> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      onChanged: (v) {
        if (v.isNotEmpty) {
          setState(() {});
        }
        widget.onChanged?.call(v);
      },
      inputFormatters: widget.formatter,
      style: const TextStyle(),
      obscureText: _isVisible,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorName.white,
        suffixIcon: _isVisible
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Assets.icons.icLightPasswordOff.svg(),
                ),
              )
            : GestureDetector(
                onTap: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Assets.icons.icLightPasswordOn.svg(),
                ),
              ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide:
              BorderSide(color: ColorName.red, style: BorderStyle.solid),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide:
              BorderSide(color: ColorName.red, style: BorderStyle.solid),
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
        errorStyle: AppStyle.header7.copyWith(color: ColorName.red),
        contentPadding: const EdgeInsets.only(
          left: 24,
          top: 18,
          bottom: 18,
          right: 12,
        ),
      ),
    );
  }
}
