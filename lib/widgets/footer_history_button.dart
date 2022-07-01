import 'package:flutter/material.dart';
import 'package:my_piggy_bank_app/themes/app_themes.dart';


class FooterHistoryButton extends StatelessWidget {
  
  final PageController pageController;

  const FooterHistoryButton({Key? key, required this.pageController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: -5,
      child: ElevatedButton(
        style: _getButtonStyle(),
        onPressed: () {
          const duration = Duration(milliseconds: 500);
          const curve = Curves.easeInOut;
          pageController.nextPage(duration: duration, curve: curve);
        },
        child: Row(
          children: const [
            Icon(Icons.arrow_drop_down, size: 40),
            _Title()   
          ],
        )
      )
    );
  }

  ButtonStyle _getButtonStyle() {
    return ElevatedButton.styleFrom(
      primary: AppTheme.primaryColor,
      elevation: 0,
      fixedSize: const Size(255, 65),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(40))
      )
    );
  }

}

class _Title extends StatelessWidget {
  
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'VER HISTORIAL', 
      style: TextStyle(letterSpacing: 3, fontWeight: FontWeight.bold, fontSize: 18)
    );
  }
}