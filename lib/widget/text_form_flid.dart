import 'package:flutter/material.dart';
import 'package:news_app/widget/app_dimensions.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.controller,
    this.preIcon,
    this.hText,
    this.keyboardType,
    this.obscureText,
    this.preIconB,
    this.size,
    this.sufIcon,
    this.sufIconB,
    this.textColor,
    this.labelText,
  });
  final String? labelText;
  final String? hText;
  final Color? textColor;
  final TextInputType? keyboardType;
  final double? size;
  final Icon? preIcon;
  final IconButton? preIconB;
  final Icon? sufIcon;
  final IconButton? sufIconB;
  final bool? obscureText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getRes(context, 30)),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        controller: controller,
        style: TextStyle(
          fontSize: getRes(context, size ?? 16),
        ),
        decoration: InputDecoration(
          label: Container(
              margin: EdgeInsets.only(left: getRes(context, 20)),
              child: Text("$labelText")),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: preIcon ?? preIconB,
          suffixIcon: sufIcon ?? sufIconB,
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          hintText: hText == null ? "" : "$hText",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
