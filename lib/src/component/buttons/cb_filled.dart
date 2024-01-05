import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poby_ui/core/core.dart';
import 'package:rxdart/rxdart.dart';

enum ButtonState {
  init,
  process,
  complete,
}

class CBFilledButton extends StatefulWidget {
  const CBFilledButton({
    super.key,
    this.width,
    this.height,
    this.textStyle,
    this.onPressed,
    required this.title,
    this.disabledColor,
    this.enabledColor,
  });

  final double? width;
  final double? height;
  final String title;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final Color? disabledColor;
  final Color? enabledColor;

  @override
  State<CBFilledButton> createState() => _CBFilledButtonState();
}

class _CBFilledButtonState extends State<CBFilledButton> {
  StreamSubscription? _subscription;
  final PublishSubject<ButtonState> _isOnSubject =
      PublishSubject<ButtonState>();

  @override
  void initState() {
    _subscription =
        _isOnSubject.throttleTime(const Duration(seconds: 1)).listen((value) {
      _listenEvent(value);
    });
    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _isOnSubject.close();
    super.dispose();
  }

  _listenEvent(ButtonState bState) async {
    if (bState == ButtonState.init) return;
    try {
      print('test');
      await Future.delayed(Duration(seconds: 3));
      widget.onPressed?.call();
      _isOnSubject.add(ButtonState.init);
      print('test 끝');
    } catch (e) {
      print(e);
    }
  }

  _onTap(ButtonState bState) {
    print('온탭');
    if (bState == ButtonState.process) return;
    _isOnSubject.add(ButtonState.process);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? context.width,
      height: widget.height ?? 40,
      child: StreamBuilder(
        stream: _isOnSubject.stream,
        builder: (BuildContext context, AsyncSnapshot<ButtonState> snapshot) {
          final value = snapshot.data ?? ButtonState.init;
          return FilledButton(
            onPressed: widget.onPressed != null ? () => _onTap(value) : null,
            style: FilledButton.styleFrom(
                backgroundColor: value == ButtonState.process
                    ? widget.enabledColor?.withOpacity(0.5)
                    : widget.enabledColor,
                disabledBackgroundColor: widget.disabledColor,
                surfaceTintColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: value == ButtonState.process
                ? const CircularProgressIndicator()
                : Text(
                    widget.title,
                    style: widget.textStyle,
                  ),
          );
        },
      ),
    );
  }
}
