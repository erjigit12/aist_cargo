import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({
    super.key,
    // this.title,
    // this.image,
    // this.name,
    // this.surName,
  });

  // final String? title;
  // final String? image;
  // final String? name;
  // final String? surName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '{widget.title}',
            style: AppTextStyles.f14w400,
            textAlign: TextAlign.center,
          ),
          20.h,
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('{widget.image}'),
          ),
          10.h,
          const Text(
            "{widget.name}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          20.h,
          const TextFieldWithTitle(title: 'Имя', hintText: '{widget.surName}'),
        ],
      ),
    );
  }
}
