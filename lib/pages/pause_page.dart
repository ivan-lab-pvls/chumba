import 'package:chumba_app/pages/home_page.dart';
import 'package:chumba_app/pages/rate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PausePage extends StatefulWidget {
  const PausePage({super.key});

  @override
  State<PausePage> createState() => _PausePageState();
}

class _PausePageState extends State<PausePage> {
  bool soundOn = false;
  bool notif = false;
  @override
  void initState() {
    super.initState();
    getSP(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/menu.png'))),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 65, 16, 20),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.chevron_left,
                    color: Color(0xFFA382FF),
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                        fontFamily: 'IBMPlexSansHebrew',
                        color: Color(0xFFA382FF),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: Row(
              children: [
                Text(
                  'Pause',
                  style: TextStyle(
                      fontFamily: 'IBMPlexSansHebrew',
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: const Color(0xFF5A1AC3),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'SOUND',
                              style: TextStyle(
                                  fontFamily: 'IBMPlexSansHebrew',
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300),
                            ),
                            CupertinoSwitch(
                              trackColor: Colors.white,
                              thumbColor: const Color(0xFF09FA86),
                              activeColor: const Color(0xFFA382FF),
                              value: user.soundOn!,
                              onChanged: (bool val) {
                                user.soundOn = val;
                                addToSP();
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: const Color(0xFF5A1AC3),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'NOTIFICATION',
                            style: TextStyle(
                                fontFamily: 'IBMPlexSansHebrew',
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w300),
                          ),
                          CupertinoSwitch(
                            trackColor: Colors.white,
                            thumbColor: const Color(0xFF09FA86),
                            activeColor: const Color(0xFFA382FF),
                            value: user.notifOn!,
                            onChanged: (bool val) {
                              user.notifOn = val;
                              addToSP();
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 15),
            child: Row(
              children: [
                Text(
                  'Information',
                  style: TextStyle(
                      fontFamily: 'IBMPlexSansHebrew',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => const Tersmxa(
                            link: 'google.com',
                          )),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: const Color(0xFF5A1AC3).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Privacy Police',
                      style: TextStyle(
                          fontFamily: 'IBMPlexSansHebrew',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: const Color(0xFF5A1AC3).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Support page',
                    style: TextStyle(
                        fontFamily: 'IBMPlexSansHebrew',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
