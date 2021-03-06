import 'package:astrotak_demo/constants.dart';
import 'package:astrotak_demo/controllers/global_controller.dart';
import 'package:astrotak_demo/controllers/providers/question_list_provider.dart';
import 'package:astrotak_demo/models/relative_list_data_model.dart';
import 'package:astrotak_demo/views/screens/profile/add_new_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriendsAndFamily extends StatefulWidget {
  const FriendsAndFamily({Key? key}) : super(key: key);

  @override
  State<FriendsAndFamily> createState() => _FriendsAndFamilyState();
}

class _FriendsAndFamilyState extends State<FriendsAndFamily> {
  bool _isEdit = false;
  bool _isAdd = false;
  RelativeObject? _relative;
  @override
  void initState() {
    super.initState();
    final relaivesData = Provider.of<AstrotakProvider>(context, listen: false);
    relaivesData.getRelativesData(context);
  }

  @override
  Widget build(BuildContext context) {
    final _relaivesData = Provider.of<AstrotakProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_balance_wallet,
                    color: Color(0xff4b60bc),
                  ),
                  const SizedBox(width: 10.0),
                  const Text(
                    'Wallet Balance: ₹ 0',
                    style: TextStyle(color: kScondaryBlueTextColor),
                  ),
                  const SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Add Money',
                      style: TextStyle(color: kScondaryBlueTextColor),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        side: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                // ignore: use_full_hex_values_for_flutter_colors
                color: const Color(0xfffe0e3f1),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 55,
            ),
            const SizedBox(height: 20.0),
            Visibility(
              maintainSize: false,
              maintainAnimation: false,
              maintainState: false,
              visible: !_isAdd && !_isEdit,
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        'Name',
                        style: TextStyle(color: kScondaryBlueTextColor),
                      ),
                      SizedBox(width: 30.0),
                      Text(
                        'DOB',
                        style: TextStyle(color: kScondaryBlueTextColor),
                      ),
                      SizedBox(width: 30.0),
                      Text(
                        'TOB',
                        style: TextStyle(color: kScondaryBlueTextColor),
                      ),
                      SizedBox(width: 15.0),
                      Text(
                        'Relation',
                        style: TextStyle(color: kScondaryBlueTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  _relaivesData.loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : _relaivesData.relatives?.data == null
                          ? const SizedBox()
                          : ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: _relaivesData
                                  .relatives?.data?.numberOfElements,
                              itemBuilder: (context, index) {
                                var _data = _relaivesData
                                    .relatives!.data!.allRelatives![index];
                                return Container(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          width: 50,
                                          child: Text(_data.fullName!,
                                              style: const TextStyle(
                                                  fontSize: 13))),
                                      const SizedBox(width: 10.0),
                                      Text(
                                          Globals.formattedDate.format(
                                              _data.dateAndTimeOfBirth!),
                                          style: const TextStyle(fontSize: 13)),
                                      const SizedBox(width: 10.0),
                                      Text(
                                          Globals.formattedTime.format(
                                              _data.dateAndTimeOfBirth!),
                                          style: const TextStyle(fontSize: 13)),
                                      const SizedBox(width: 15.0),
                                      const SizedBox(
                                          width: 70,
                                          child: Text('Mother in law',
                                              style: TextStyle(fontSize: 13))),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          InkWell(
                                            child: const Icon(
                                              Icons.edit,
                                              color: kPrimartyButtonColor,
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _relative = _data;
                                                _isEdit = true;
                                                _isAdd = false;
                                              });
                                            },
                                          ),
                                          const SizedBox(width: 30.0),
                                          InkWell(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (ctx) =>
                                                      SimpleDialog(
                                                    title: const Center(
                                                      child: Text(
                                                          "Do you really want to delete?"),
                                                    ),
                                                    children: <Widget>[
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                ElevatedButton(
                                                              onPressed: () {},
                                                              child: const Text(
                                                                  'Yes'),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary:
                                                                    kPrimartyButtonColor,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          Expanded(
                                                            child:
                                                                ElevatedButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                  'No'),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary:
                                                                    kPrimartyButtonColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 10,
                                                            vertical: 20),
                                                    titleTextStyle:
                                                        const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                    vertical: 20.0,
                                  ),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                );
                              }),
                  const SizedBox(height: 50.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isEdit = false;
                        _isAdd = true;
                      });
                    },
                    child: const Text('+ Add New Profile'),
                    style: ElevatedButton.styleFrom(
                      primary: kPrimartyButtonColor,
                    ),
                  ),
                  const SizedBox(height: 100.0),
                ],
              ),
            ),
            Visibility(
              maintainSize: false,
              maintainAnimation: false,
              maintainState: false,
              visible: _isAdd || _isEdit,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _isAdd = false;
                          _isEdit = false;
                        });
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_left,
                        size: 35,
                      )),
                  Text(_isAdd ? 'Add New Profile' : 'Edit Profile')
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Visibility(
              child: AddEditNewProfileScreen(
                isEdit: false,
              ),
              maintainSize: false,
              maintainAnimation: false,
              maintainState: false,
              visible: _isAdd,
            ),
            Visibility(
              child: AddEditNewProfileScreen(
                relativeData: _relative,
                isEdit: true,
              ),
              maintainSize: false,
              maintainAnimation: false,
              maintainState: false,
              visible: _isEdit,
            ),
          ],
        ),
      ),
    );
  }
}
