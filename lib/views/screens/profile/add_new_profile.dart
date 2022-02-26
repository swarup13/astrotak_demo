import 'package:astrotak_demo/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddEditNewProfileScreen extends StatefulWidget {
  const AddEditNewProfileScreen({Key? key}) : super(key: key);

  @override
  _AddEditNewProfileScreenState createState() =>
      _AddEditNewProfileScreenState();
}

class _AddEditNewProfileScreenState extends State<AddEditNewProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        CustomTextField(),
      ],
    );
  }
}
