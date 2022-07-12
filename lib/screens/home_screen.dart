import 'package:flutter/material.dart';

import 'package:my_piggy_bank_app/screens/screens.dart';
import 'package:my_piggy_bank_app/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 0);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        physics: const PageScrollPhysics(),
        children: [
          Stack(
            children: [
              const InfoScreen(),
              FooterHistoryButton(pageController: pageController)
            ]
          ),
          WillPopScope(
            child: const HistoryScreen(),
            onWillPop: () async {
              const duration = Duration(milliseconds: 500);
              const curve = Curves.easeInOut;
              pageController.previousPage(duration: duration, curve: curve);
              return false;
            }
          )
        ]
      )
    );
  }
  
}