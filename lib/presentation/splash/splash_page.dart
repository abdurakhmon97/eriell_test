import 'package:eriell/gen/assets.gen.dart';
import 'package:eriell/routes/app_routes.dart';
import 'package:eriell/ui/themes/app_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _appLogoHeight = 120.0;

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController lottieAnimation;

  ValueNotifier<bool> expanded = ValueNotifier(false);

  final duration = const Duration(seconds: 1);

  MediaQueryData getQueryData(BuildContext context) => MediaQuery.of(context);

  @override
  void initState() {
    super.initState();
    lottieAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    Future.delayed(duration).then((_) {
      expanded.value = true;
      lottieAnimation.forward().then((value) => context.replace(Routes.signIn));
    });
  }

  @override
  void dispose() {
    lottieAnimation.dispose();
    expanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getQueryData(context).size.width,
        height: getQueryData(context).size.height,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              padding: const EdgeInsets.all(8),
              duration: duration,
              curve: Curves.fastOutSlowIn,
              child: Image.asset(
                Assets.images.splash.keyName,
                height: _appLogoHeight,
                fit: BoxFit.fitWidth,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: expanded,
              builder: (_, bool expanded, __) {
                return AnimatedCrossFade(
                  firstCurve: Curves.fastOutSlowIn,
                  crossFadeState: !expanded
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: duration,
                  firstChild: Container(),
                  secondChild: Text(
                    "ERIELL",
                    style: AppStyle.interW700x20WBlack,
                  ),
                  alignment: Alignment.centerLeft,
                  sizeCurve: Curves.easeInOut,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
