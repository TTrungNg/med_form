import 'package:flutter/material.dart';
import 'package:med_form/data/med_price.dart';

class MedInputView extends StatefulWidget {
  const MedInputView({super.key});

  @override
  State<MedInputView> createState() => _MedInputViewState();
}

class _MedInputViewState extends State<MedInputView> {
  String _displayStringForOption(MapEntry<String, int> med) => med.key;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Autocomplete<MapEntry<String, int>>(
                    displayStringForOption: _displayStringForOption,
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<MapEntry<String, int>>.empty();
                      }
                      return med_price.entries.where((MapEntry option) {
                        return option.key
                            .toString()
                            .contains(textEditingValue.text);
                      });
                    },
                    // onSelected: (MapEntry<String, int> selection) {
                    //   debugPrint(
                    //       'You just selected ${_displayStringForOption(selection)}');
                    // },
                    fieldViewBuilder:
                        (ctx, textEditingControler, focusNode, onSub) {
                      return TextField(
                        focusNode: focusNode,
                        controller: textEditingControler,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Tên thuốc'),
                        onSubmitted: (value) {
                          if (!med_price.keys.contains(value)) {
                            textEditingControler.clear();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Vui lòng nhập đúng tên thuốc')),
                            );
                          } else {
                            debugPrint('Day la luc hanh dong');
                          }
                        },
                        onTapOutside: (event) {
                          if (!med_price.keys
                              .contains(textEditingControler.text)) {
                            textEditingControler.clear();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Vui lòng nhập đúng tên thuốc')),
                            );
                          } else {
                            debugPrint('Day la luc hanh dong');
                          }
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'G'),
                    onSubmitted: (value) {},
                  ),
                )
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => MedFormDisplay(
                  //               patient: Patient(
                  //                   name: 'Nguyen Van A',
                  //                   age: 31,
                  //                   diagnosis: 'RLSL',
                  //                   amountOfDose: 10,
                  //                   medicine: [
                  //                 {
                  //                   'medName': 'Viễn trí',
                  //                   'G': 8,
                  //                   'price': 1800,
                  //                   'total': 9600
                  //                 },
                  //                 {
                  //                   'medName': 'Lạc tiên',
                  //                   'G': 12,
                  //                   'price': 800,
                  //                   'total': 10000
                  //                 }
                  //               ]))),
                  // );
                  debugPrint('');
                },
                child: const Text("In Đơn")),
          ],
        ),
      ),
    );
  }
}
