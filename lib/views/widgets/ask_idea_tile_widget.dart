import 'package:astrotak_demo/constants.dart';
import 'package:flutter/material.dart';

class AskIdeaTileWidget extends StatelessWidget {
  final String title;
  const AskIdeaTileWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Transform.rotate(
                    angle: 0.75,
                    child: Material(
                      elevation: 10.0,
                      child: Container(
                        height: 28,
                        width: 28,
                        decoration: const BoxDecoration(
                          color: kPrimartyButtonColor,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    right: 3,
                    top: 3,
                    child: Icon(
                      Icons.not_listed_location_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(width: 10.0),
              Flexible(child: Text(title, style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.normal,
              ),)),
            ],
          ),
          const SizedBox(height: 10.0),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
