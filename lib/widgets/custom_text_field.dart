import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String customText;
  final TextInputType keyboardType;
  CustomTextField({this.controller,this.keyboardType,this.customText});
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType:keyboardType ,
      controller: controller,
      decoration: InputDecoration(
        labelText: customText,
      ),
    );
  }
}