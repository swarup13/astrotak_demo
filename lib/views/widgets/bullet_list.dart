import 'package:astrotak_demo/constants.dart';
import 'package:flutter/material.dart';

class BulletList extends StatelessWidget {
  final List<String> strings;

  const BulletList({Key? key, required this.strings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: strings.map((str) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '•',
                style: TextStyle(
                  fontSize: 20,
                  height: 1.55,
                  color: kPrimartyButtonColor
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  str,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style:const TextStyle(
                    // fontSize: 16,
                    color: kPrimartyButtonColor,
                    height: 1.55,
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
