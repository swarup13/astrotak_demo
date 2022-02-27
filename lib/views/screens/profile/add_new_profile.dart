import 'package:astrotak_demo/constants.dart';
import 'package:astrotak_demo/controllers/global_controller.dart';
import 'package:astrotak_demo/models/relative_list_data_model.dart';
import 'package:astrotak_demo/views/widgets/custom_dropdown.dart';
import 'package:astrotak_demo/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddEditNewProfileScreen extends StatefulWidget {
  RelativeObject? relativeData;
  bool isEdit;
  AddEditNewProfileScreen({Key? key, this.relativeData, this.isEdit = false})
      : super(key: key);

  @override
  _AddEditNewProfileScreenState createState() =>
      _AddEditNewProfileScreenState();
}

class _AddEditNewProfileScreenState extends State<AddEditNewProfileScreen> {
  String? _selectedGender;
  String? _selectedRelaion;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _hourController = TextEditingController();
  final TextEditingController _minuteController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();

  List<bool> isSelected = [true, false];

  @override
  void initState() {
    super.initState();
    _assignEditData();
  }

  _assignEditData() {
    if (widget.isEdit) {
      setState(() {
        var _data = widget.relativeData!;
        _nameController.text = _data.fullName ?? '';
        _dateController.text = _data.dateAndTimeOfBirth?.day.toString() ?? '';
        _monthController.text =
            _data.dateAndTimeOfBirth?.month.toString() ?? '';
        _yearController.text = _data.dateAndTimeOfBirth?.year.toString() ?? '';
        _hourController.text = _data.dateAndTimeOfBirth?.hour.toString() ?? '';
        _minuteController.text =
            _data.dateAndTimeOfBirth?.minute.toString() ?? '';
        _placeController.text = _data.birthPlace?.placeName ?? '';
        // _selectedGender = _data.gender ?? '';
        // _selectedRelaion = _data.relation ?? '';
        isSelected =
            _data.dateAndTimeOfBirth!.hour > 12 ? [false, true] : [true, false];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          title: 'Name',
          hint: '',
          editingController: _nameController,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                title: 'Date of Birth',
                hint: 'DD',
                editingController: _dateController,
                length: 2,
                format: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
                ],
                keyboard: TextInputType.number,
              ),
            ),
            Expanded(
              child: CustomTextField(
                title: '',
                hint: 'MM',
                editingController: _monthController,
                length: 2,
                format: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
                ],
                keyboard: TextInputType.number,
              ),
            ),
            Expanded(
              child: CustomTextField(
                title: '',
                hint: 'YYYY',
                editingController: _yearController,
                length: 4,
                format: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
                ],
                keyboard: TextInputType.number,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                title: 'Time of Birth',
                hint: 'HH',
                editingController: _hourController,
                length: 2,
                format: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
                ],
                keyboard: TextInputType.number,
              ),
            ),
            Expanded(
              child: CustomTextField(
                title: '',
                hint: 'MM',
                editingController: _minuteController,
                length: 2,
                format: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
                ],
                keyboard: TextInputType.number,
              ),
            ),
            Center(
              child: ToggleButtons(
                // borderColor: Colors.black,
                fillColor: const Color(0xff4b60bc),
                // borderWidth: 2,
                selectedBorderColor: const Color(0xff4b60bc),
                borderColor: Colors.grey.shade300,
                selectedColor: Colors.white,
                borderRadius: BorderRadius.circular(5),
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'AM',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'PM',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                  });
                },
                isSelected: isSelected,
              ),
            ),
          ],
        ),
        CustomTextField(
          title: 'Place of Birth',
          hint: '',
          editingController: _placeController,
        ),
        Row(
          children: [
            Expanded(
              child: CustomDropDown(
                items: const ['MALE', 'FEMALE'],
                title: 'Gender',
                value: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value.toString();
                  });
                },
              ),
            ),
            Expanded(
              child: CustomDropDown(
                items: const [
                  'Brother',
                  'Mother',
                  'Son',
                  'Daughter',
                  'Father',
                  'Mother in law',
                ],
                title: 'Relation',
                value: _selectedRelaion,
                onChanged: (value) {
                  setState(() {
                    _selectedRelaion = value.toString();
                  });
                },
              ),
            )
          ],
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {},
          child: const Text('+ Add New Profile'),
          style: ElevatedButton.styleFrom(
            primary: kPrimartyButtonColor,
          ),
        ),
        const SizedBox(height: 100.0),
      ],
    );
  }
}
