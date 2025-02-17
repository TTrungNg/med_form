import 'package:flutter/material.dart';
import 'package:med_form/model/patient.dart';
import 'package:med_form/data/med_price.dart';
import 'package:intl/intl.dart';

class FormatInvoice {
  static Patient patientInfor(
      TextEditingController patientName,
      TextEditingController patientAge,
      TextEditingController diagnosis,
      TextEditingController amountOfDose,
      TextEditingController decoctionPrice,
      List<TextEditingController> medNameList,
      List<TextEditingController> gList) {
    List<Map<String, dynamic>> medicine = [];
    int pricePerDose = 0;
    for (int i = 0; i < medNameList.length; i++) {
      int price = med_price.entries
          .firstWhere((element) => medNameList[i].text == element.key)
          .value;
      int total = int.tryParse(gList[i].text)! * price;
      pricePerDose += total;

      medicine.add({
        'medName': medNameList[i].text,
        'g': gList[i].text,
        'price': price,
        'total': total
      });
    }
    int decoctionPriceInt = int.parse(decoctionPrice.text);
    int priceMed = pricePerDose * int.parse(amountOfDose.text);
    int totalInvoice = priceMed + decoctionPriceInt;

    return Patient(
        name: patientName.text,
        age: patientAge.text,
        diagnosis: diagnosis.text,
        amountOfDose: amountOfDose.text,
        medicine: medicine,
        decoctionPrice:
            NumberFormat('#,###', 'vi_VN').format(decoctionPriceInt),
        pricePerDose: pricePerDose.toString(),
        priceMed: NumberFormat('#,###', 'vi_VN').format(priceMed),
        totalInvoice: NumberFormat('#,###', 'vi_VN').format(totalInvoice));
  }
}
