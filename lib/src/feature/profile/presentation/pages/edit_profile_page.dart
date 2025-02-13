import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
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
          Text(
            '{widget.title}',
            style: AppTextStyles.f14w400,
            textAlign: TextAlign.center,
          ),
          20.h,
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('{widget.image}'),
          ),
          10.h,
          Text(
            "{widget.name}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          20.h,
          TextFieldWithTitle(title: 'Имя', hintText: '{widget.surName}'),
        ],
      ),
    );
  }
}
