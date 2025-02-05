import 'package:flutter/material.dart';
import 'package:med_form/view/med_form_display.dart';

class MedInputView extends StatefulWidget {
  const MedInputView({super.key});

  @override
  State<MedInputView> createState() => _MedInputViewState();
}

class _MedInputViewState extends State<MedInputView> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Input here'),
        MedFormDisplay(donThuoc: [
          {'Medicine': 'Nhuc dung', 'G': 12},
          {'Medicine': 'Vien tri', 'G': 8}
        ]),
      ],
    );
  }
}
