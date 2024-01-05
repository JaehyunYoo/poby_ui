// Widgetbook file: widgetbook.dart
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'src/use_case/widget_book_use_case.dart';

void main() {
  runApp(const HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        InspectorAddon(enabled: true),
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone13,
            Devices.ios.iPhone12,
            Devices.ios.iPhone13Mini,
            Devices.ios.iPhone13ProMax,
            Devices.android.samsungGalaxyS20,
            Devices.android.samsungGalaxyNote20Ultra,
            Devices.android.samsungGalaxyA50,
          ],
          initialDevice: Devices.ios.iPhone13,
        ),
      ],
      directories: [
        WidgetbookCategory(
          name: 'Buttons',
          children: [
            WidgetbookComponent(
              name: 'CBFilledButton',
              useCases: cases,
            )
          ],
        ),
      ],
    );
  }
}
