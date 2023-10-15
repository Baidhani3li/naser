import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextAlign textAlign;
  final TextDirection? textDir;
  final String? value;
  final bool enabled;
  final Widget? suffixIcon;

  const CustomFormField({
    required this.label,
    this.inputType,
    this.validator,
    this.onSaved,
    this.textAlign = TextAlign.start,
    this.textDir,
    this.value,
    this.suffixIcon,
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: TextFormField(
        initialValue: value,
        textAlign: textAlign,
        textDirection: textDir,
        enabled: enabled,
        decoration: InputDecoration(
          // floatingLabelAlignment: FloatingLabelAlignment.center,
          labelText: label,

          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          suffixIcon: suffixIcon,
        ),
        validator: validator,
        onSaved: onSaved,
        keyboardType: inputType,
      ),
    );
  }
}
