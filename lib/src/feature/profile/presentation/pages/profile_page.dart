import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Пробиль'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Верхняя часть: Имя и номер телефона
              _buildUserInfo(),
              const SizedBox(height: 20),
              // Секция "Мои поездки"
              _buildMyTripsSection(),
              const SizedBox(height: 20),
              // Секция "Профиль"
              _buildProfileSection(),
              const SizedBox(height: 20),
              // Секция "Информация"
              _buildInfoSection(),
              const SizedBox(height: 20),
              // Кнопка выхода
              _buildLogoutButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Айжан Асылова',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          '+996 503-00-00-00',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildMyTripsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Мои поездки',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            Expanded(
              child: Text(
                'Все',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
        const SizedBox(height: 10),
        _buildTripItem('Коробка М (высоко) от двух лет'),
        _buildTripItem('Пробиль'),
      ],
    );
  }

  Widget _buildTripItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.check_box_outline_blank, size: 24),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProfileButton('Редактировать пробиль'),
        _buildProfileButton('Мои поездки'),
        _buildProfileButton('Мои подписки'),
        _buildProfileButton('Поддержка'),
      ],
    );
  }

  Widget _buildProfileButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.arrow_forward_ios, size: 16),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoItem('Часто задаваемые вопросы'),
        _buildInfoItem('Политика конфиденциальности'),
        _buildInfoItem('Пользовательское соглашение'),
        _buildInfoItem('О приложении'),
      ],
    );
  }

  Widget _buildInfoItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Действие при выходе из аккаунта
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        ),
        child: const Text(
          'Выйти из аккаунта',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
