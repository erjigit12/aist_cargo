import 'package:flutter/material.dart';

class TripCard extends StatelessWidget {
  final String name;
  final String tripNumber;
  final String from;
  final String to;
  final String departureDate;
  final String arrivalDate;
  final String packageType;
  final String packageSize;
  final String profileImageUrl;

  const TripCard({
    super.key,
    required this.name,
    required this.tripNumber,
    required this.from,
    required this.to,
    required this.departureDate,
    required this.arrivalDate,
    required this.packageType,
    required this.packageSize,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber[100], // Фон карточки
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Верхняя часть с фото и именем
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(profileImageUrl),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '№ $tripNumber',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Жёлтая кнопка "Поездка"
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Поездка',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Описание
          const Text(
            'Я даю гарантию безопасную транспортировку.',
            style: TextStyle(fontSize: 14),
          ),

          const SizedBox(height: 12),

          // Информация о поездке
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Бишкек',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Баткен',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Дата вылета\n$departureDate',
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                'Дата прилёта\n$arrivalDate',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '$packageType   $packageSize',
            style: const TextStyle(fontSize: 14),
          ),

          const SizedBox(height: 16),

          // Кнопки "Архивировать" и "Редактировать"
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black54,
                  ),
                  child: const Text('Архивировать'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                  child: const Text('Редактировать'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
