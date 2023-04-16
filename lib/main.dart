import 'package:chatgpt/view_model/provider/chats_provider.dart';
import 'package:chatgpt/view_model/provider/models_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/themes/app_theme.dart';
import 'view/screens/onboarding_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ModelsProvider()),
        ChangeNotifierProvider(create: (context) => ChatProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: AppBarTheme(color: AppTheme.cardColor),
            scaffoldBackgroundColor: AppTheme.scaffoldBackgroundColor),
        home: const OnboardingScreen(),
      ),
    );
  }
}
