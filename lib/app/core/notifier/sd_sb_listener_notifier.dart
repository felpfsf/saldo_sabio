import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:saldo_sabio/app/core/notifier/sd_sb_change_notifier.dart';
import 'package:saldo_sabio/app/core/ui/helpers/messages.dart';

typedef SuccessVoidCallback = void Function(
  SdSbChangeNotifier notifier,
  SdSbListenerNotifier listener,
);

typedef ErrorVoidCallback = void Function(
  SdSbChangeNotifier notifier,
  SdSbListenerNotifier listener,
);

typedef InfoVoidCallback = void Function(
  SdSbChangeNotifier notifier,
  SdSbListenerNotifier listener,
);

class SdSbListenerNotifier {
  final SdSbChangeNotifier sdsbNotifier;

  SdSbListenerNotifier({
    required this.sdsbNotifier,
  });

  void listener({
    required BuildContext context,
    required SuccessVoidCallback onSuccess,
    InfoVoidCallback? onInfo,
    ErrorVoidCallback? onError,
  }) {
    sdsbNotifier.addListener(() {
      if (onInfo != null) {
        onInfo(sdsbNotifier, this);
      }

      if (sdsbNotifier.isLoading) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }

      if (sdsbNotifier.hasError) {
        if (onError != null) {
          onError(sdsbNotifier, this);
        }
        Messages.showError(
          context,
          sdsbNotifier.error ?? 'Erro interno',
        );
      }

      if (sdsbNotifier.isSuccess) {
        onSuccess(sdsbNotifier, this);
      }
    });
  }

  void dispose() {
    sdsbNotifier.removeListener(() {});
  }
}
