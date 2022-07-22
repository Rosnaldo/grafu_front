import 'package:flutter/material.dart';

class PassworFormField extends StatefulWidget {
  final String label;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  const PassworFormField({
    Key? key,
    required this.label,
    required this.focusNode,
    required this.nextFocusNode,
  }) : super(key: key);

  @override
  State<PassworFormField> createState() => PassworFormFieldState();
}

class PassworFormFieldState extends State<PassworFormField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      onFieldSubmitted: (_) => widget.nextFocusNode.requestFocus(),
      obscureText: _obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: '********',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: Colors.blue,
          ),
        ),
        prefixIcon: const Icon(Icons.lock),
      ),
    );
  }
}
