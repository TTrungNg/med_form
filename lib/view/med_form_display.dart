import 'package:flutter/material.dart';

class MedFormDisplay extends StatelessWidget {
  final List<Map<String, dynamic>> donThuoc;
  const MedFormDisplay({required this.donThuoc, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            'images/logo.png',
            width: 75,
          ),
          const SizedBox(
            height: 16,
          ),
          const Row(
            children: [
              Text('BSCK II NGUYỄN THỊ TÁM'),
              Spacer(),
              Text('NGÀY 24 THÁNG 1 NĂM 2025')
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
          const Row(
            children: [
              Text('Họ và tên: Đinh Công Vân'),
              SizedBox(
                width: 56,
              ),
              Text('Tuổi: 41')
            ],
          ),
          const Text('Chẩn đoán: Viêm CT'),
          const Text('7 thang 898.000đ'),
          const SizedBox(
            height: 4,
          ),
          Table(
              columnWidths: const {
                0: FlexColumnWidth(0.8),
                1: FlexColumnWidth(5),
                2: FlexColumnWidth(0.8),
                3: FlexColumnWidth(2),
                4: FlexColumnWidth(2)
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
                ...donThuoc.map(
                  (thuoc) => TableRow(children: [
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
                        thuoc['Medicine'],
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        thuoc['G'].toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        '1200',
                        textAlign: TextAlign.end,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        '4500',
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ]),
                )
              ]),
        ]));
  }
}
