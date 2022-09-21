import 'package:flutter/material.dart';
import 'package:grafu/styles/color.dart';
import 'package:grafu/styles/text_form.dart';

class EmailFormField extends StatelessWidget {
  final String label;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  const EmailFormField({
    Key? key,
    required this.label,
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
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: fieldGray,
        labelText: label,
        labelStyle: const TextStyle(color: fieldSecondaryText),
        hintText: 'usuario@exemplo.com.br',
        hintStyle: const TextStyle(color: fieldSecondaryText),
        prefixIcon: const Icon(Icons.email, color: fieldIcon),
        enabledBorder: grayFieldFormBorder,
        focusedBorder: grayFieldFormBorder,
      ),
    );
  }
}
