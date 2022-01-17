import 'package:flutter/material.dart';
import 'package:safe_vault_version_2/atomic_design/molecules/text_form_field_widget.dart';

class AlertDiaologs extends StatelessWidget {
    final List actions;
    TextFormFields textFormFields = TextFormFields(decoration: InputDecoration(),);

    AlertDiaologs({Key? key , required this.actions }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
    AlertDiaologs(
      actions: [
        textFormFields,

      ],
    );
}


