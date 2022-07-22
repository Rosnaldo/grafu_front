import 'package:flutter/cupertino.dart';

class ScreenStore extends ValueNotifier<int> {
  ScreenStore() : super(0);

  changeScreen(v) => value = v;
}
