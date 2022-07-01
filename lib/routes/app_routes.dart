import 'package:flutter/material.dart';

import 'package:my_piggy_bank_app/screens/screens.dart';


class AppRoutes {
  
  static String initialRoute = 'home';

  static Map<String, Widget Function(BuildContext)> routes = {
    'home':  ( _ ) => const HomeScreen()
  };

}