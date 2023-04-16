import 'package:chatgpt/constants/themes/app_theme.dart';
import 'package:chatgpt/view/widget/sign_in_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedLogin extends StatelessWidget {
  const AnimatedLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: 514,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
            color: AppTheme.white.withOpacity(0.94),
            borderRadius: const BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          child: Column(
              children: const [
                Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 34,
                    fontFamily: "Poppins",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Sign in to SiaBot is chatbot application enable communication via text or audio, messaging applications, mobile apps.",
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(child: SignInForm()),
              ],
            ),

        ),
      ),
    );
  }
}

