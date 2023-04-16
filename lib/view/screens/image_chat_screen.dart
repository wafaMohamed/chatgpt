import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/themes/app_theme.dart';
import '../../services/services.dart';
import '../widget/side_menu.dart';

class ImageGenerator extends StatefulWidget {
  const ImageGenerator({Key? key}) : super(key: key);

  @override
  State<ImageGenerator> createState() => _ImageGeneratorState();
}
//change
class _ImageGeneratorState extends State<ImageGenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        elevation: 2,
        title: const Center(child: Text("AI Image Generator")),
      ),
    );
  }
}
