class Patient {
  Patient(
      {required this.name,
      required this.age,
      required this.diagnosis,
      required this.medicine});

  final String name;
  final int age;
  final String diagnosis;
  final List<Map<String, dynamic>> medicine;
}
