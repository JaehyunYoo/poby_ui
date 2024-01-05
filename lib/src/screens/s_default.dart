import 'package:flutter/material.dart';
import 'package:poby_ui/src/component/components.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({
    super.key,
    required this.body,
    required this.appTitle,
  });
  final String appTitle;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: body,
    );
  }
}
