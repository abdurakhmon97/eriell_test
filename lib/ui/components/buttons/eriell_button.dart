import 'package:eriell/gen/colors.gen.dart';
import 'package:eriell/ui/themes/app_style.dart';
import 'package:flutter/material.dart';

const _buttonHeight = 52.0;

class EriellButton extends StatefulWidget {
  final String title;
  final bool isActive;
  final bool isLoading;
  final VoidCallback onPressed;

  const EriellButton({
    required this.title,
    this.isActive = false,
    this.isLoading = false,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<EriellButton> createState() => _EriellButtonState();
}

class _EriellButtonState extends State<EriellButton> {
  @override
  Widget build(BuildContext context) {
    return widget.isActive
        ? OutlinedButton(
            style: ButtonStyle(
              side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
              fixedSize: MaterialStateProperty.resolveWith<Size>(
                (Set<MaterialState> states) {
                  return Size(
                    MediaQuery.of(context).size.width,
                    _buttonHeight,
                  );
                },
              ),
              maximumSize: MaterialStateProperty.resolveWith<Size>(
                (Set<MaterialState> states) {
                  return Size(
                    MediaQuery.of(context).size.width,
                    _buttonHeight,
                  );
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return ColorName.pressedButtonColor;
                  } else if (states.contains(MaterialState.disabled)) {
                    return ColorName.defaultButtonColor;
                  }
                  return ColorName.primary;
                },
              ),
            ),
            onPressed: () {
              widget.onPressed.call();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  widget.title,
                  style: AppStyle.buttonText.copyWith(color: ColorName.white),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Visibility(
                    visible: widget.isLoading,
                    child: Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(right: 12),
                      child: const CircularProgressIndicator(
                        strokeWidth: 2.4,
                        valueColor: AlwaysStoppedAnimation(ColorName.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : OutlinedButton(
            style: ButtonStyle(
              side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
              fixedSize: MaterialStateProperty.resolveWith<Size>(
                (Set<MaterialState> states) {
                  return Size(
                    MediaQuery.of(context).size.width,
                    _buttonHeight,
                  );
                },
              ),
              maximumSize: MaterialStateProperty.resolveWith<Size>(
                (Set<MaterialState> states) {
                  return Size(
                    MediaQuery.of(context).size.width,
                    _buttonHeight,
                  );
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return ColorName.primary;
                  } else if (states.contains(MaterialState.disabled)) {
                    return ColorName.cardColorLight;
                  }
                  return ColorName.cardColorLight;
                },
              ),
            ),
            onPressed: null,
            child: Text(
              widget.title,
              style: AppStyle.buttonText.copyWith(
                color: ColorName.subtitleColorDark,
              ),
            ),
          );
  }
}
