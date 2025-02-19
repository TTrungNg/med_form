import 'package:flutter/material.dart';
import 'package:med_form/data/med_price.dart';

class MedInputUnit extends StatefulWidget {
  const MedInputUnit(
      {required this.medName, required this.g, required this.index, super.key});

  final TextEditingController medName;
  final TextEditingController g;
  final int index;

  @override
  State<MedInputUnit> createState() => _MedInputUnitState();
}

class _MedInputUnitState extends State<MedInputUnit> {
  String _displayStringForOption(MapEntry<String, int> med) => med.key;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Autocomplete<MapEntry<String, int>>(
              onSelected: (option) {
                widget.medName.text = option.key;
              },
              //3: Khi chọn xong option, controler medName lưu giá trị option đó
              displayStringForOption: _displayStringForOption,
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<MapEntry<String, int>>.empty();
                }
                return med_price.entries.where((MapEntry option) {
                  return option.key.toString().contains(textEditingValue.text);
                });
              },
              fieldViewBuilder: (ctx, textEditingControler, focusNode, onSub) {
                return TextField(
                  focusNode: focusNode,
                  controller: widget
                      .medName, //1: Chọn medName làm controler để lưu giá trị cho lớp MedInputView
                  decoration: InputDecoration(
                      label: Text(
                        (widget.index + 1).toString(),
                        style: const TextStyle(fontSize: 22),
                      ),
                      border: const OutlineInputBorder(),
                      hintText: 'Tên thuốc'),
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (value) {
                    textEditingControler.text = widget.medName.text;
                    //2: Để textEditingControler đồng bộ với medName -> Hiển thị option của Autocomplete
                  },
                  onSubmitted: (value) {
                    if (!med_price.keys.contains(value)) {
                      widget.medName.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Vui lòng nhập đúng tên thuốc')),
                      );
                    }
                  },
                  onTapOutside: (event) {
                    if (!med_price.keys.contains(textEditingControler.text)) {
                      widget.medName.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Vui lòng nhập đúng tên thuốc')),
                      );
                    }

                    FocusManager.instance.primaryFocus
                        ?.unfocus(); //Tắt bàn phím
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
              controller: widget.g,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'G'),
            ),
          )
        ],
      ),
    );
  }
}
