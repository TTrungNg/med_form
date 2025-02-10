import 'package:flutter/material.dart';
import 'package:med_form/model/patient.dart';

class MedFormDisplay extends StatelessWidget {
  final Patient patient;
  const MedFormDisplay({required this.patient, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đơn thuốc'),
        actions: [
          ElevatedButton(onPressed: () {}, child: const Text("Xuất Đơn"))
        ],
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(12),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(
                'images/logo.png',
                width: 75,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Text('BSCK II NGUYỄN THỊ TÁM'),
                  const Spacer(),
                  Text(
                      'NGÀY ${DateTime.now().day} THÁNG ${DateTime.now().month} NĂM ${DateTime.now().year}')
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              const Center(
                child: Text(
                  'ĐƠN THUỐC',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text('Họ và tên: ${patient.name}'),
                  const SizedBox(
                    width: 56,
                  ),
                  Text('Tuổi: ${patient.age}')
                ],
              ),
              Text('Chẩn đoán: ${patient.diagnosis}'),
              Row(
                children: [
                  Expanded(
                      child: Text(
                          '${patient.amountOfDose} thang ${patient.totalInvoice}đ')),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(child: Text('Sắc ${patient.decoctionPrice}đ')),
                  Expanded(
                      child: Text(
                          'Tổng ${int.tryParse(patient.totalInvoice)! + int.tryParse(patient.decoctionPrice)!}đ'))
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Table(
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(5),
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
                          child: Text(
                            'STT',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Tên thuốc',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'G',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Đơn giá',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Thành tiền',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    ...patient.medicine.map((row) => TableRow(children: [
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              '1',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              row['medName'],
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              row['g'].toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              row['price'].toString(),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              row['total'].toString(),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ]))
                  ]),
            ])),
      ),
    );
  }
}
