import 'package:chumba_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/boad.png'))),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 65, 16, 0),
                      child: Image.asset('assets/cards.png'),
                    ),
                    if (page == 1)
                      Padding(
                        padding: const EdgeInsets.only(top: 300),
                        child: Container(
                          height: MediaQuery.of(context).size.height - 300,
                          padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                          decoration: BoxDecoration(
                              color: const Color(0xFF11002C).withOpacity(0.6),
                              borderRadius: BorderRadius.circular(30)),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'Are you ready to become a master of analysing emotions?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'IBMPlexSansHebrew',
                                              color: Colors.white,
                                              height: 1.2,
                                              fontSize: 32,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(16, 0, 16, 60),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'In this game you will find yourself facing mysterious opponents, whom you can make up yourself - each of whom hides their emotions behind a mask.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'IBMPlexSansHebrew',
                                              color: Color(0xFFA382FF),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                  child: InkWell(
                                    onTap: () {
                                      if (page == 0) {
                                        page++;
                                        setState(() {});
                                      } else {
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  const HomePage()),
                                        );
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF5A1AC3),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: const Text(
                                        'Start',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'IBMPlexSansHebrew',
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                if (page == 0)
                  Container(
                    height: MediaQuery.of(context).size.height - 300,
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                    decoration: BoxDecoration(
                        color: const Color(0xFF11002C).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(30)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Welcome to a exciting world of emotion and intrigue!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'IBMPlexSansHebrew',
                                        color: Colors.white,
                                        height: 1.2,
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Here, every move is a chance to reveal feelings and unravel the opponents combinations',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'IBMPlexSansHebrew',
                                        color: Color(0xFFA382FF),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: InkWell(
                              onTap: () {
                                if (page == 0) {
                                  page++;
                                  setState(() {});
                                } else {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const HomePage()),
                                  );
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF5A1AC3),
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Text(
                                  'CONTINUE',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'IBMPlexSansHebrew',
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
