import 'package:flutter/material.dart';
import 'package:grafu/styles/color.dart';
import 'package:grafu/styles/text_form.dart';

class NameFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  const NameFormField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.focusNode,
    required this.nextFocusNode,
    required this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: focusNode,
      onFieldSubmitted: (_) => nextFocusNode.requestFocus(),
      onSaved: onSaved,
      keyboardType: TextInputType.name,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: fieldGray,
        labelText: label,
        labelStyle: const TextStyle(color: fieldSecondaryText),
        hintText: hintText,
        hintStyle: const TextStyle(color: fieldSecondaryText),
        enabledBorder: grayFieldFormBorder,
        focusedBorder: grayFieldFormBorder,
        prefixIcon: const Icon(Icons.person, color: fieldIcon),
      ),
    );
  }
}
