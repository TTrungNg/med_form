import 'package:flutter/material.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:med_form/model/patient.dart';
import 'package:screenshot/screenshot.dart';

class MedFormDisplay extends StatelessWidget {
  final Patient patient;
  const MedFormDisplay({required this.patient, super.key});

  @override
  Widget build(BuildContext context) {
    ScreenshotController screenshotController = ScreenshotController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đơn thuốc'),
        actions: [
          ElevatedButton(
              onPressed: () {
                screenshotController
                    .capture(delay: const Duration(milliseconds: 10))
                    .then((capturedImage) async {
                  await ImageGallerySaverPlus.saveImage(capturedImage!);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Thông báo',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        content:
                            const Text('Đã lưu đơn vào thư viện rùi moẹ nhoé'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Đóng dialog
                            },
                            child: const Text('OKE BÉO'),
                          ),
                        ],
                      );
                    },
                  );

                  debugPrint('Da luu Don vao thu vien');
                }).catchError((onError) {
                  debugPrint(onError);
                });
              },
              child: const Text("Xuất Đơn"))
        ],
      ),
      body: SingleChildScrollView(
        child: Screenshot(
            controller: screenshotController, child: _buildForm(patient)),
      ),
    );
  }
}

Widget _buildForm(Patient patient) {
  return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset(
          'images/logo.png',
          width: 75,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            const Expanded(
                child: Text(
              'BSCK II NGUYỄN THỊ TÁM',
              style: TextStyle(fontSize: 11),
            )),
            Expanded(
              child: Text(
                'NGÀY ${DateTime.now().day} THÁNG ${DateTime.now().month} NĂM ${DateTime.now().year}',
                style: const TextStyle(fontSize: 11),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 18,
        ),
        const Center(
          child: Text(
            'ĐƠN THUỐC',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Text('Họ và tên: ${patient.name}',
                style: const TextStyle(fontSize: 12)),
            const SizedBox(
              width: 56,
            ),
            Text('Tuổi: ${patient.age}', style: const TextStyle(fontSize: 12))
          ],
        ),
        Text('Chẩn đoán: ${patient.diagnosis}',
            style: const TextStyle(fontSize: 12)),
        Row(
          children: [
            Expanded(
                child: Text(
                    '${patient.amountOfDose} thang ${patient.priceMed}đ',
                    style: const TextStyle(fontSize: 12))),
            const SizedBox(
              width: 24,
            ),
            Expanded(
                child: Text('Sắc ${patient.decoctionPrice}đ',
                    style: const TextStyle(fontSize: 12))),
            Expanded(
                child: Text('Tổng ${patient.totalInvoice}đ',
                    style: const TextStyle(fontSize: 12)))
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Table(
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(4),
              2: FlexColumnWidth(0.8),
              3: FlexColumnWidth(2),
              4: FlexColumnWidth(2.5)
            },
            border: TableBorder.all(),
            children: [
              const TableRow(
                children: [
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('STT',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('Tên thuốc',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('G',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('Đơn giá',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'Thành tiền',
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              for (int i = 0; i < patient.medicine.length; i++)
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('${i + 1}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(patient.medicine[i]['medName'],
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(patient.medicine[i]['g'].toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(patient.medicine[i]['price'].toString(),
                        textAlign: TextAlign.end,
                        style: const TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(patient.medicine[i]['total'].toString(),
                        textAlign: TextAlign.end,
                        style: const TextStyle(fontSize: 12)),
                  ),
                ]),
              TableRow(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'Tổng',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(''),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      '',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      '',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(patient.pricePerDose,
                        textAlign: TextAlign.end,
                        style: const TextStyle(fontSize: 12)),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'Số thang',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      patient.amountOfDose,
                      style: const TextStyle(fontSize: 12),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      '',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      '',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(patient.priceMed,
                        textAlign: TextAlign.end,
                        style: const TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ]),
      ]));
}
