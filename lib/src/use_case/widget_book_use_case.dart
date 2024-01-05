import 'package:flutter/material.dart';
import 'package:poby_ui/src/component/components.dart';
import 'package:poby_ui/src/screens/s_default.dart';
import 'package:widgetbook/widgetbook.dart';

final List<WidgetbookUseCase> cases = [
  WidgetbookUseCase(
    name: 'Case',
    builder: (BuildContext context) {
      return DefaultScreen(
        appTitle: 'FilledButton',
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: CBFilledButton(
              title:
                  context.knobs.string(label: 'title', initialValue: '텍스트 입력'),
              enabledColor: context.knobs.color(
                label: 'enabledColor',
                initialValue: const Color(0xFF6750A4),
              ),
              disabledColor: context.knobs.color(
                label: 'disabledColor',
                initialValue: const Color(0xFFEEEEEE),
              ),
              textStyle: TextStyle(
                color: context.knobs.color(
                  label: 'TextColor',
                  initialValue: const Color(0xFFFFFFFF),
                ),
              ),
              onPressed:
                  context.knobs.boolean(label: 'onPressed', initialValue: false)
                      ? () {}
                      : null,
            ),
          ),
        ),
      );
    },
  ),
];
