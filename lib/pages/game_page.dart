import 'package:carousel_slider/carousel_slider.dart';
import 'package:chumba_app/model/character_item.dart';
import 'package:chumba_app/model/combination_item.dart';
import 'package:chumba_app/pages/check_page.dart';
import 'package:chumba_app/pages/home_page.dart';
import 'package:chumba_app/pages/pause_page.dart';
import 'package:flutter/material.dart';

enum EGameStage { start, combinations, finalPage }

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  CarouselController carouselController = CarouselController();
  CharacterItem selectedCharacter = CharacterItem();
  List<CombinationItem> combinations = [];
  EGameStage currentStage = EGameStage.start;
  int initialPage = 0;
  @override
  void initState() {
    super.initState();
    combinations = [];
    for (var player in currentCharacters) {
      player.userChosenHand = null;
      combinations.add(player.currentHand!);
    }
    combinations.shuffle();
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HomePage()),
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
                                builder: (BuildContext context) =>
                                    const PausePage()),
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
                                      initialPage = count;
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                        if (currentStage == EGameStage.start)
                          getCurrentCharacters(),
                        if (currentStage == EGameStage.combinations &&
                            currentCharacters
                                    .elementAt(initialPage)
                                    .userChosenHand ==
                                null)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: getCombinations(),
                          ),
                        if (currentStage == EGameStage.combinations &&
                            currentCharacters
                                    .elementAt(initialPage)
                                    .userChosenHand !=
                                null)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: InkWell(
                              onTap: () {
                                combinations.add(currentCharacters
                                    .elementAt(initialPage)
                                    .userChosenHand!);
                                currentCharacters
                                    .elementAt(initialPage)
                                    .userChosenHand = null;
                                setState(() {});
                              },
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
                                      currentCharacters
                                          .elementAt(initialPage)
                                          .userChosenHand!
                                          .image!,
                                      scale: 3.5,
                                    ),
                                    Text(
                                      currentCharacters
                                          .elementAt(initialPage)
                                          .userChosenHand!
                                          .name!,
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
                          ),
                        if (currentStage == EGameStage.start)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
                            child: InkWell(
                              onTap: () {
                                currentStage = EGameStage.combinations;
                                setState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF5A1AC3),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Text(
                                  'CHOOSE COMBINATION',
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
                  ),
                ),
                if (currentStage == EGameStage.start)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          'Check',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'IBMPlexSansHebrew',
                              color: Color(0xFF5A1AC3),
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                if (currentStage == EGameStage.combinations)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
                    child: InkWell(
                      onTap: () {
                        if (currentCharacters
                                    .elementAt(0)
                                    .userChosenHand !=
                                null &&
                            currentCharacters.elementAt(1).userChosenHand !=
                                null &&
                            currentCharacters.elementAt(2).userChosenHand !=
                                null) {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const CheckPage()),
                          );
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: currentCharacters
                                            .elementAt(0)
                                            .userChosenHand !=
                                        null &&
                                    currentCharacters
                                            .elementAt(1)
                                            .userChosenHand !=
                                        null &&
                                    currentCharacters
                                            .elementAt(2)
                                            .userChosenHand !=
                                        null
                                ? const Color(0xFF5A1AC3)
                                : const Color(0xFF5A1AC3).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          'Done',
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
            )));
  }

  Widget getCombinations() {
    List<Widget> list = [];
    for (var combination in combinations) {
      list.add(InkWell(
        onTap: () {
          if (currentCharacters.elementAt(initialPage).userChosenHand == null) {
            currentCharacters.elementAt(initialPage).userChosenHand =
                combination;
            combinations.remove(combination);
            carouselController.nextPage();
            setState(() {});
          }
        },
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
                combination.image!,
                scale: 3.5,
              ),
              Text(
                combination.name!,
                style: const TextStyle(
                    fontFamily: 'IBMPlexSansHebrew',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ));
      list.add(const SizedBox(
        height: 8,
      ));
    }
    return Column(
      children: list,
    );
  }

  Widget getCurrentCharacters() {
    List<Widget> list = [];
    for (var character in currentCharacters) {
      list.add(InkWell(
        onTap: () {
          selectedCharacter = character;
          setState(() {});
        },
        child: Image.asset(
          selectedCharacter == character
              ? character.winOutlinePhoto!
              : character.outlinePhoto!,
          scale: 3.0,
        ),
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

List<Widget> getCharacters() {
  List<Widget> list = [];
  for (var character in currentCharacters) {
    list.add(Container(
      decoration: BoxDecoration(
          color: const Color(0xFF5a1ac3),
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(image: AssetImage(character.bigPhoto!))),
    ));
  }
  return list;
}
