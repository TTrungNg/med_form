class Patient {
  Patient(
      {required this.name,
      required this.age,
      required this.diagnosis,
      required this.amountOfDose,
      required this.medicine});

  final String name;
  final int age;
  final String diagnosis;
  final int amountOfDose;
  final List<Map<String, dynamic>> medicine;

  int get totalBill {
    int bill = 0;
    for (final med in medicine) {
      bill += (med['total']) as int;
    }
    return bill;
  }
}
