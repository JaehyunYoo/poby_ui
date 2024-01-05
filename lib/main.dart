import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poby_ui/src/component/buttons/cb_filled.dart';
import 'package:poby_ui/src/screens/s_default.dart';

void main() {
  runApp(
    MaterialApp(
      home: DefaultScreen(
        appTitle: '',
        body: Center(
          child: CBFilledButton(
            enabledColor: Colors.amberAccent,
            title: '테스트111',
            onPressed: () {
              print('tes1231231t');
            },
          ),
        ),
      ),
    ),
  );
}
