import 'package:eriell/routes/app_pages.dart';
import 'package:eriell/ui/themes/app_themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp.router(
        title: 'Eriell app',
        theme: Themes.lightTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: AppPages.router,
      ),
    );
  }
}
