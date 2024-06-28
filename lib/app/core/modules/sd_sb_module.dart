import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:saldo_sabio/app/core/modules/sd_sb_page.dart';

abstract class SdSbModule {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;

  SdSbModule({
    List<SingleChildWidget>? bindings,
    required Map<String, WidgetBuilder> routers,
  })  : _bindings = bindings ?? [],
        _routers = routers;

  Map<String, WidgetBuilder> get routers {
    return _routers.map(
      (key, pageBuilder) => MapEntry(
        key,
        (_) => SdSbPage(
          bindings: _bindings,
          page: pageBuilder,
        ),
      ),
    );
  }

  Widget getPage(String path, BuildContext context) {
    final widgetBuilder = _routers[path];

    if (widgetBuilder == null) {
      throw Exception('Route $path not found');
    }

    return SdSbPage(page: widgetBuilder, bindings: _bindings);
  }
}
