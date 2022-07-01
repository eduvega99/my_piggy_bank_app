import 'package:flutter/material.dart';
import 'package:my_piggy_bank_app/routes/app_routes.dart';
import 'package:my_piggy_bank_app/themes/app_themes.dart';

void main() => runApp(const App());

class App extends StatelessWidget {

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Piggy Bank',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }

}
