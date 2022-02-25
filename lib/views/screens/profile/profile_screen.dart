import 'package:astrotak_demo/constants.dart';
import 'package:astrotak_demo/views/screens/profile/friends_and_family.dart';
import 'package:flutter/material.dart';

class ProfileSectionScreen extends StatefulWidget {
  const ProfileSectionScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSectionScreen> createState() => _ProfileSectionScreenState();
}

class _ProfileSectionScreenState extends State<ProfileSectionScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  TabController? _profileTabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _profileTabController =
        TabController(length: 2, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: (() => Navigator.pop(context)),
              icon: const Icon(
                Icons.keyboard_arrow_left,
                color: kPrimartyButtonColor,
                size: 35.0,
              )),
          title: Image.asset(
            'assets/icons/icon.png',
            height: 60,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 15, 12),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Logout',
                  style: TextStyle(color: kPrimartyButtonColor),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                    side: const BorderSide(
                      color: kPrimartyButtonColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
          bottom: TabBar(
            indicatorColor: kPrimartyButtonColor,
            labelColor: kPrimartyButtonColor,
            unselectedLabelColor: Colors.black54,
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'My Profile',
              ),
              Tab(
                text: 'Order History',
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TabBarView(controller: _tabController, children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                    ),
                    child: TabBar(
                      labelPadding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                      controller: _profileTabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ),
                        color: kPrimartyButtonColor,
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black54,
                      labelStyle: const TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.normal),
                      tabs: const [
                        Tab(
                          text: 'Basic Profile',
                        ),
                        Tab(
                          text: 'Friends and Family Profile',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _profileTabController,
                      children: const [
                        Center(child: Text('Coming Soon')),
                        FriendsAndFamily(),
                      ],
                    ),
                  ),
                ],
              ),
              const Center(child: Text('Coming Soon')),
            ]),
          ),
        ));
  }
}
