class SendEntity {
  final int id;
  final String fullName;
  final String phoneNumber;
  final String fromWhere;
  final String toWhere;
  final String dispatchDate;
  final String arrivalDate;
  final String description;
  final String packageType;
  final String size;
  final String status;

  SendEntity({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.fromWhere,
    required this.toWhere,
    required this.dispatchDate,
    required this.arrivalDate,
    required this.description,
    required this.packageType,
    required this.size,
    required this.status,
  });
}
