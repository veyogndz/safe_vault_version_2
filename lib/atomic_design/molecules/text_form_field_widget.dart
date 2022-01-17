import 'package:flutter/material.dart';
class TextFormFields extends StatelessWidget {

  final InputDecoration decoration;
  final icon;
  final hintTexts;
  final labelTexts;
  const TextFormFields({Key? key , required this.decoration , this.icon , this.hintTexts , this.labelTexts}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      TextFormField(
      decoration: InputDecoration(
        icon: icon,
        hintText: hintTexts,
        labelText: labelTexts,
      ),
      );

}
