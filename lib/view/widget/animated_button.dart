import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

import '../../constants/themes/app_theme.dart';
import 'animated_login.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({Key? key}) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  late RiveAnimationController buttonAnimationController;
  late VoidCallback press;

  @override
  void initState() {
    buttonAnimationController = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buttonAnimationController.isActive = true;
        Future.delayed(Duration(milliseconds: 800), () {
          showGeneralDialog(
            barrierDismissible: true,
            barrierLabel: "Sign In",
            context: context,
            transitionDuration: Duration(milliseconds: 600),
            transitionBuilder: (context, animation, secondaryAnimation, child) {
              Tween<Offset> tween;
              tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
              return SlideTransition(
                position: tween.animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeOut),
                ),
                child: child,
              );
            },
            pageBuilder: (context, _, __) => AnimatedLogin(),
          );
        });
      },
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          children: [
            RiveAnimation.asset("assets/RiveAssets/button.riv",
                controllers: [buttonAnimationController]),
            Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.arrow_right,
                    color: AppTheme.siaColor,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Start Ask SiaBot",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.siaColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
