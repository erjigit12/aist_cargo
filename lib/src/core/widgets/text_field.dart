// ignore_for_file: library_private_types_in_public_api

import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    this.hintText,
    this.suffix = false,
    this.backroundColor = Colors.transparent,
    this.controller,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.onTap,
    this.isRead,
  });

  final String? hintText;
  final bool? suffix;
  final Color? backroundColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool? isRead;

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.isRead ?? false,
      onTap: widget.onTap,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      obscureText: widget.suffix == true ? _obscureText : false,
      validator: widget.validator,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: AppColors.hintTextColor),
        fillColor: widget.backroundColor,
        filled: true,
        suffixIcon: widget.suffix == true
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : const SizedBox(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
