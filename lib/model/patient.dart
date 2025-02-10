class Patient {
  Patient(
      {required this.name,
      required this.age,
      required this.diagnosis,
      required this.amountOfDose,
      required this.medicine,
      required this.decoctionPrice,
      required this.totalInvoice});

  final String name;
  final String age;
  final String diagnosis;
  final String amountOfDose;
  final String decoctionPrice;
  final String totalInvoice;
  final List<Map<String, dynamic>> medicine;
}
