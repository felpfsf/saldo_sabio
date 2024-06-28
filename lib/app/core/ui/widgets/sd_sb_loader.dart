import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SdSbLoader extends StatelessWidget {
  const SdSbLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.prograssiveDots(
        color: Colors.amber,
        size: 50,
      ),
    );
  }
}
