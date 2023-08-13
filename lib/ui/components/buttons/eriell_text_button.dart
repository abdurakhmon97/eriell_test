import 'package:eriell/ui/themes/app_style.dart';
import 'package:flutter/material.dart';

const _buttonHeight = 52.0;

class EriellTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final EdgeInsets margin;

  const EriellTextButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          elevation: 0,
          primary: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          side: const BorderSide(color: Colors.transparent),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          minimumSize: Size(
            MediaQuery.of(context).size.width,
            _buttonHeight,
          ),
        ),
        child: Text(
          title,
          style: AppStyle.interW700x16Gray4,
        ),
      ),
    );
  }
}
