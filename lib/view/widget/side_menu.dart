import 'package:chatgpt/services/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../constants/themes/app_theme.dart';
import '../screens/chat_screen.dart';
import '../screens/image_chat_screen.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: double.infinity,
        width: 288,
        color: Colors.black,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              LottieBuilder.network(
                'https://assets1.lottiefiles.com/packages/lf20_q8ND1A8ibK.json',
                height: 250,
                fit: BoxFit.cover,
                reverse: true,
                repeat: true,
              ),
              Material(
                color: AppTheme.scaffoldBackgroundColor,
                child: ListTile(
                  title: Text(
                    "ChatGpt",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatScreen(),
                        ));
                  },
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppTheme.white,
                    child:
                        ClipOval(child: Image.asset(AssetManager.openaiLogo)),
                  ),
                ),
              ),
              const Divider(color: Colors.black),
              Material(
                color: AppTheme.scaffoldBackgroundColor,
                child: ListTile(
                  title: Text(
                    "Image Generator",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ImageGenerator(),
                        ));
                  },
                  leading: CircleAvatar(
                    backgroundColor: AppTheme.gptColor,
                    child: Icon(
                      CupertinoIcons.photo,
                      color: AppTheme.white,
                    ),
                  ),
                ),
              ),
              const Divider(color: Colors.black),
              Material(
                color: AppTheme.scaffoldBackgroundColor,
                child: ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Voice Chatbot",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.white),
                      ),
                      Text(
                        "Text to Speech",
                        style: TextStyle(fontSize: 15, color: AppTheme.white),
                      ),
                    ],
                  ),
                  onTap: () {},
                  leading: CircleAvatar(
                    backgroundColor: AppTheme.gptColor,
                    child: Icon(
                      CupertinoIcons.text_bubble,
                      color: AppTheme.white,
                    ),
                  ),
                ),
              ),
              const Divider(color: Colors.black),
              Material(
                color: AppTheme.scaffoldBackgroundColor,
                child: ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Voice Chatbot",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.white),
                      ),
                      Text(
                        "Speech to Text",
                        style: TextStyle(fontSize: 15, color: AppTheme.white),
                      ),
                    ],
                  ),
                  onTap: () {},
                  leading: CircleAvatar(
                    backgroundColor: AppTheme.gptColor,
                    child: Icon(
                      CupertinoIcons.mic,
                      color: AppTheme.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
