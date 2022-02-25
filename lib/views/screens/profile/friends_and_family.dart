import 'package:flutter/material.dart';

class FriendsAndFamily extends StatelessWidget {
  const FriendsAndFamily({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  style: TextStyle(color: Color(0xff4b60bc)),
                ),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Add Money',
                    style: TextStyle(color: Color(0xff4b60bc)),
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
            height: 70,
          ),
          Table(
            children: [],
          )
        ],
      ),
    );
  }
}
