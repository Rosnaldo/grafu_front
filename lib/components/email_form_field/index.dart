import 'package:flutter/material.dart';

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
        labelText: label,
        hintText: 'Preencha seu email',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        prefixIcon: const Icon(Icons.email),
      ),
    );
  }
}
