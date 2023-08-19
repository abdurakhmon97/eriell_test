import 'package:eriell/data/hive/credentials_hive_object.dart';
import 'package:eriell/routes/app_pages.dart';
import 'package:eriell/ui/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setupHive();
  runApp(const MyApp());
}

Future<void> _setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CredentialsHiveObjectAdapter());
  await Hive.openBox<CredentialsHiveObject>('users');
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
