class DeliveryEntity {
  final int id;
  final int userId;
  final String userImage;
  final String fullName;
  final String transportNumber;
  final String description;
  final String fromWhere;
  final String dispatchDate;
  final String toWhere;
  final String arrivalDate;
  final String size;
  final String phoneNumber;
  final String roleType;

  DeliveryEntity({
    required this.id,
    required this.userId,
    required this.userImage,
    required this.fullName,
    required this.transportNumber,
    required this.description,
    required this.fromWhere,
    required this.dispatchDate,
    required this.toWhere,
    required this.arrivalDate,
    required this.size,
    required this.phoneNumber,
    required this.roleType,
  });
}
