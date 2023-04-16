import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({Key? key, required this.child, this.size=100}) : super(key: key);
final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return     Positioned.fill(
      child: Column(
        children: [
          Spacer(),
          SizedBox(
            height: size,
            width: size,
            child:child,
          ),
          Spacer(flex: 2,),
        ],
      ),
    );
  }
}
