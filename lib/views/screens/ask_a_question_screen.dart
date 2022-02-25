import 'package:astrotak_demo/constants.dart';
import 'package:astrotak_demo/controllers/routes.dart';
import 'package:astrotak_demo/views/widgets/ask_idea_tile_widget.dart';
import 'package:astrotak_demo/views/widgets/bullet_list.dart';
import 'package:flutter/material.dart';

class AskAQuestionScreen extends StatelessWidget {
  const AskAQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _selectedCategory = 'Love';
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Image.asset(
              'assets/icons/hamburger.png',
              fit: BoxFit.cover,
            ),
            onPressed: () {
              // scaffoldKey.currentState?.openDrawer();
            }),
        title: Image.asset(
          'assets/icons/icon.png',
          height: 60,
        ),
        actions: [
          IconButton(
              icon: Image.asset(
                'assets/icons/profile.png',
                fit: BoxFit.cover,
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.profileSection);
              }),
        ],
       
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: const Color(0xff4b60bc),
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Row(children: [
              const Text(
                'Wallet Balance: ₹ 0',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Add Money',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10.0),
                  const Text('Ask a Question', style: kBlackBoldHeading),
                  const SizedBox(height: 10.0),
                  const Text(
                      'Seek accurate answers to your life problems and get guidance towards the right path. Whether the problem is related to love, self, life, business, money, education or work, our astrologers will do an in depth study of your birth chart to provide personalizedresponses along with remedies.',
                      style: TextStyle(color: Colors.black54)),
                  const SizedBox(height: 10),
                  const Text(
                    'Choose Category',
                    style: kBlackBoldHeading,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedCategory,
                        items: <String>['Love', 'Future', 'Business']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                        isExpanded: true,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1.0,
                        ),
                        right: BorderSide(
                          color: Colors.grey.shade300,
                          width: 0.5,
                        ),
                        left: BorderSide(
                          color: Colors.grey.shade300,
                          width: 0.5,
                        ),
                        top: BorderSide(
                          color: Colors.grey.shade200,
                          width: 0.3,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: MediaQuery.of(context).size.width,
                    child: ListView(
                      children: [
                        Theme(
                          data: ThemeData(
                            primaryColor: Colors.redAccent,
                            primaryColorDark: Colors.red,
                          ),
                          child: const TextField(
                            maxLength: 150,
                            maxLines: 3,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal)),
                              hintText: 'Type a question here',
                            ),
                          ),
                        ),
                     
                  const SizedBox(height: 10),
                  const Text(
                    'Ideas what to ask (Select Any)',
                    style: kBlackBoldHeading,
                  ),
                  const SizedBox(height: 10),
                        ListView(
                          shrinkWrap: true,
                          primary: false,
                          children: const [
                            AskIdeaTileWidget(
                              title:
                                  'When is the right for me to introduce my boyfriend / girlfriend?',
                            ),
                            AskIdeaTileWidget(
                              title:
                                  'Doubtful about taking my relationship to nextlevel?',
                            ),
                            AskIdeaTileWidget(
                              title:
                                  'How will I meet my potential life partner?',
                            ),
                            AskIdeaTileWidget(
                              title: 'Is my wife/Husband faihful?',
                            ),
                            AskIdeaTileWidget(
                              title: 'Will I ever meet my true love?',
                            ),
                            AskIdeaTileWidget(
                              title: 'When will I get in relationship?',
                            ),
                          ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Seeking accurate answers to difficult questions troubling your mind? Ask credible astrologers to know what future has in store for you.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    child: const BulletList(strings: [
                      'Personalized responses provided by our team of Vedic astrologers within 24 hours',
                      'Qualified and experienced astrologers will look into your birth chart and provide the right guidance.'
                          'You can seek answers to any part of your life and for most pressing issues.',
                      'Our team of Vedic astrologers will not just provide answers but also suggest a remedial solution'
                    ]),
                    decoration: BoxDecoration(
                      color: kPrimartyButtonColor.withAlpha(25),
                    ),
                  ),
                  const SizedBox(height: 25),
               
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '₹ 150 ( 1 Question on Love )',
                  style: TextStyle(color: Colors.white),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Ask Now',
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.normal),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        side: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: const Color(0xff4b60bc),
                borderRadius: BorderRadius.circular(10.0)),
          )
        ],
      )),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(
          bottom: 50.0,
        ),
        child: FloatingActionButton(
          backgroundColor: const Color(0xffff944d),
          onPressed: () {},
          child: const Icon(Icons.menu),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        // onTap: (int index) {
        //   setState(() {
        //     this.index = index;
        //   });
        // },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/home.png',
              height: 20,
              color: Colors.grey,
            ),
            backgroundColor: Colors.transparent,
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/talk.png',
              height: 20,
            ),
            label: "Talk",
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/ask.png',
              height: 20,
              color: const Color(0xffff944d),
            ),
            label: "Ask Question",
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/reports.png',
              height: 20,
            ),
            label: "Reports",
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/chat.png',
              height: 20,
            ),
            label: "Chat",
            backgroundColor: Colors.transparent,
          ),
        ],
        selectedItemColor: const Color(0xffff944d),
        backgroundColor: Colors.transparent,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
      ),
    );
  }
}




