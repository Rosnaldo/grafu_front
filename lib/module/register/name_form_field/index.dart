import 'package:flutter/material.dart';

class NameFormField extends StatelessWidget {
  final String label;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  const NameFormField({
    Key? key,
    required this.label,
    required this.focusNode,
    required this.nextFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onFieldSubmitted: (_) => nextFocusNode.requestFocus(),
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
          prefixIcon: const Icon(Icons.person)),
    );
  }
}
