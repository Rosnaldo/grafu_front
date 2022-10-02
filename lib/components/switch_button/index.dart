import 'package:flutter/material.dart';
import 'package:grafu/styles/color.dart';

class SwitchButtonOption {
  String label;
  IconData icon;

  SwitchButtonOption({
    required this.label,
    required this.icon,
  });
}

class SwitchButton extends StatefulWidget {
  final SwitchButtonOption option1;
  final SwitchButtonOption option2;
  final List<bool> isSelected;
  final void Function(int)? onPressed;

  const SwitchButton({
    Key? key,
    required this.option1,
    required this.option2,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<SwitchButton> createState() => SwitchButtonState();
}

class SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: mainBackGround,
      child: LayoutBuilder(builder: (context, constraints) {
        return ToggleButtons(
          renderBorder: false,
          constraints: BoxConstraints.expand(width: constraints.maxWidth / 2),
          isSelected: widget.isSelected,
          selectedColor: Colors.white,
          color: Colors.black,
          fillColor: mainOrange,
          onPressed: widget.onPressed,
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(widget.option1.icon, color: mainStrongText),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      widget.option1.label,
                      style: const TextStyle(color: mainStrongText),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(widget.option2.icon, color: mainStrongText),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      widget.option2.label,
                      style: const TextStyle(color: mainStrongText),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
