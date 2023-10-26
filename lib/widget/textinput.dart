import 'package:flutter/material.dart';

@immutable
class InputText extends TextField {
  final String hintText;
  final String labelText;
  final BuildContext context;
  final bool isObscurse;
  const InputText(this.isObscurse,
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.context});

  Widget inputTextField() => TextField(
        onTapOutside: (event) =>
            FocusScope.of(context).requestFocus(FocusNode()),
        style: const TextStyle(fontSize: 25),
        obscureText: isObscurse,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.purple,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );
}
