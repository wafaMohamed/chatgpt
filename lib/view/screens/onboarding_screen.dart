import 'dart:ui';

import 'package:chatgpt/constants/themes/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../widget/animated_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
                width: MediaQuery.of(context).size.width * 1.7,
                bottom: 200,
                left: 100,
                child: Image.asset("assets/Backgrounds/Spline.png")),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20,
                  sigmaY: 10,
                ),
              ),
            ),
            const RiveAnimation.asset(
              "assets/RiveAssets/shapes.riv",
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 30,
                  sigmaY: 30,
                ),
                child: const SizedBox(),
              ),
            ),
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    width: 260,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Now You Can Ask",
                          style: TextStyle(
                              color: AppTheme.white,
                              fontSize: 48,
                              fontFamily: "Poppins",
                              height: 1.2),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "SiaBot ",
                            style: TextStyle(
                                color: AppTheme.siaColor,
                                fontSize: 48,
                                fontFamily: "Poppins",
                                height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          "A SiaBot is chatbot it's application that can imitate a real conversation with a user in their natural language. Chatbots enable communication via text or audio on websites, messaging applications, mobile apps.",
                          style: TextStyle(
                            color: AppTheme.white,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 310),
                  AnimatedButton(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
