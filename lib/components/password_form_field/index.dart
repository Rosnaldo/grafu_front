import 'package:flutter/material.dart';
import 'package:grafu/styles/color.dart';
import 'package:grafu/styles/text_form.dart';

class PassworFormField extends StatefulWidget {
  final String label;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const PassworFormField({
    Key? key,
    required this.label,
    required this.focusNode,
    required this.nextFocusNode,
    required this.onSaved,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  State<PassworFormField> createState() => PassworFormFieldState();
}

class PassworFormFieldState extends State<PassworFormField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: widget.focusNode,
      onFieldSubmitted: (_) => widget.nextFocusNode.requestFocus(),
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      obscureText: _obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: fieldGray,
        errorMaxLines: 2,
        labelText: widget.label,
        labelStyle: const TextStyle(color: fieldSecondaryText),
        hintText: '********',
        hintStyle: const TextStyle(color: fieldSecondaryText),
        errorStyle: const TextStyle(color: alertRed),
        enabledBorder: grayFieldFormBorder,
        focusedBorder: grayFieldFormBorder,
        suffixIcon: IconButton(
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: fieldIcon,
          ),
        ),
        prefixIcon: const Icon(Icons.lock, color: fieldIcon),
      ),
    );
  }
}
