import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    super.key,
    this.title,
    this.image,
    this.name,
    this.surName,
  });

  final String? title;
  final String? image;
  final String? name;
  final String? surName;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Укажите основную информацию, чтобы завоевать больше доверие людей',
            style: AppTextStyles.f14w400,
            textAlign: TextAlign.center,
          ),
          20.h,
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/semi_truck.png'),
          ),
          10.h,
          const Text(
            "Айжан Асылова",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          20.h,
          const TextFieldWithTitle(title: 'Имя', hintText: 'Айжан Асылова'),
        ],
      ),
    );
  }
}
