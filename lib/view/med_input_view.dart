import 'package:flutter/material.dart';
import 'package:med_form/widget/med_input_unit.dart';

class MedInputView extends StatefulWidget {
  const MedInputView({super.key});

  @override
  State<MedInputView> createState() => _MedInputViewState();
}

class _MedInputViewState extends State<MedInputView> {
  List<TextEditingController> medNameList = [];
  List<TextEditingController> gList = [];

  void setMedName(int index, String medName) {
    medNameList[index].text = medName;
  }

  void setMedG(int index, String g) {
    gList[index].text = g;
  }

  void dismissMed(int index) {
    setState(() {
      medNameList.removeAt(index);
      gList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Form'),
        backgroundColor: const Color.fromARGB(255, 82, 200, 255),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  debugPrint(medNameList.length.toString());
                  for (int i = 0; i < medNameList.length; i++) {
                    debugPrint("Ten thuoc: ${medNameList[i].text}");
                    debugPrint("So luong: ${gList[i].text}");
                  }
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
                child: const Text('In Đơn')),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Dismissible(
                      direction: DismissDirection.endToStart,
                      background: Container(
                        padding: const EdgeInsets.only(right: 12),
                        alignment: Alignment.centerRight,
                        color: Colors.red,
                        child: const Icon(Icons.delete),
                      ),
                      onDismissed: (direction) => dismissMed(index),
                      key: ValueKey(medNameList[index]),
                      child: MedInputUnit(
                        medName: medNameList[index],
                        g: gList[index],
                        index: index,
                      ));
                },
                itemCount: medNameList.length,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      medNameList.add(TextEditingController());
                      gList.add(TextEditingController());
                    });
                    debugPrint(gList.length.toString());
                  },
                  icon: const Icon(
                    Icons.add_circle_outline,
                    size: 36,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
