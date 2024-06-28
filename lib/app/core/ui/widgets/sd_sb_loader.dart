import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SdSbLoader extends AsyncOverlay {
  SdSbLoader()
      : super(
          id: 0,
          builder: (BuildContext context, AsyncValue<RouteSettings> settings) {
            final widthSize = MediaQuery.of(context).size.width * 0.8;
            return Center(
              child: SizedBox(
                width: widthSize,
                child: LoadingAnimationWidget.inkDrop(
                    color: Colors.amber, size: 50),
              ),
            );
          },
        );
}
