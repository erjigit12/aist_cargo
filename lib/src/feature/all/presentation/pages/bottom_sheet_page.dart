import 'package:flutter/material.dart';

void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    // Чтобы сделать красивый скруглённый верх,
    // лучше всего задать и backgroundColor, и shape.
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        // Задний «фоновый» Container с закруглённым верхом
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // чтоб размер подгонялся под содержимое
          children: [
            // Первый вариант — «Поездки»
            ListTile(
              leading: const Icon(Icons.directions_car),
              title: const Text('Поездки'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Действие при нажатии
                // ...
                Navigator.pop(context);
              },
            ),
            // Второй вариант — «Посылки»
            ListTile(
              leading: const Icon(Icons.local_shipping),
              title: const Text('Посылки'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Действие при нажатии
                // ...
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      );
    },
  );
}
