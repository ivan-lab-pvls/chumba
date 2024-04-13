import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chumba_app/model/character_item.dart';
import 'package:chumba_app/pages/final_game_page.dart';
import 'package:chumba_app/pages/game_page.dart';
import 'package:chumba_app/pages/home_page.dart';
import 'package:chumba_app/pages/pause_page.dart';
import 'package:flutter/material.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  CharacterItem selected = currentCharacters.first;
  CarouselController carouselController = CarouselController();
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const HomePage()),
                        (route) => false);
                  },
                  child: const Row(
                    children: [
                      Text(
                        'Menu',
                        style: TextStyle(
                            fontFamily: 'IBMPlexSansHebrew',
                            color: Color(0xFFA382FF),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => const PausePage()),
                    );
                  },
                  child: const Row(
                    children: [
                      Text(
                        'Pause',
                        style: TextStyle(
                            fontFamily: 'IBMPlexSansHebrew',
                            color: Color(0xFFA382FF),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: Row(
              children: [
                Text(
                  'COMBINATION',
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CarouselSlider(
                            carouselController: carouselController,
                            items: getCharacters(),
                            options: CarouselOptions(
                              // /aspectRatio: 1,
                              onPageChanged: (count, reason) {
                                selected = currentCharacters.elementAt(count);
                                setState(() {});
                              },
                              aspectRatio: 16 / 9,
                              viewportFraction: 1,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              scrollDirection: Axis.horizontal,
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  carouselController.previousPage();
                                },
                                child: Image.asset(
                                  'assets/back.png',
                                  scale: 3.5,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  carouselController.nextPage();
                                },
                                child: Image.asset(
                                  'assets/next.png',
                                  scale: 3.5,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: getCurrentCharacters(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF5a1ac3),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            selected.userChosenHand!.image!,
                            scale: 3.5,
                          ),
                          Text(
                            selected.userChosenHand!.name!,
                            style: const TextStyle(
                                fontFamily: 'IBMPlexSansHebrew',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const FinalGamePage()),
                    (route) => false);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0xFF5A1AC3),
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  'CHECK',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'IBMPlexSansHebrew',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget getCurrentCharacters() {
    List<Widget> list = [];
    for (var character in currentCharacters) {
      list.add(Image.asset(
        selected == character
            ? character.winOutlinePhoto!
            : character.outlinePhoto!,
        scale: 3.0,
      ));
      list.add(const SizedBox(
        width: 8,
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list,
    );
  }
}
