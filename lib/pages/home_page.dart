import 'dart:convert';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:chumba_app/model/character_item.dart';
import 'package:chumba_app/model/combination_item.dart';
import 'package:chumba_app/model/user.dart';
import 'package:chumba_app/pages/game_page.dart';
import 'package:chumba_app/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum EChooseType { grid, line }

UserItem user = UserItem(notifOn: true, soundOn: true);

List<CharacterItem> characters = [
  CharacterItem(
    bigPhoto: 'assets/1.png',
    outlinePhoto: 'assets/line1.png',
    winOutlinePhoto: 'assets/win1.png',
  ),
  CharacterItem(
    bigPhoto: 'assets/2.png',
    outlinePhoto: 'assets/line2.png',
    winOutlinePhoto: 'assets/win2.png',
  ),
  CharacterItem(
    bigPhoto: 'assets/3.png',
    outlinePhoto: 'assets/line3.png',
    winOutlinePhoto: 'assets/win3.png',
  ),
  CharacterItem(
    bigPhoto: 'assets/4.png',
    outlinePhoto: 'assets/line4.png',
    winOutlinePhoto: 'assets/win4.png',
  ),
  CharacterItem(
    bigPhoto: 'assets/5.png',
    outlinePhoto: 'assets/line5.png',
    winOutlinePhoto: 'assets/win5.png',
  ),
  CharacterItem(
    bigPhoto: 'assets/6.png',
    outlinePhoto: 'assets/line6.png',
    winOutlinePhoto: 'assets/win6.png',
  ),
  CharacterItem(
    bigPhoto: 'assets/7.png',
    outlinePhoto: 'assets/line7.png',
    winOutlinePhoto: 'assets/win7.png',
  ),
  CharacterItem(
    bigPhoto: 'assets/8.png',
    outlinePhoto: 'assets/line8.png',
    winOutlinePhoto: 'assets/win8.png',
  ),
  CharacterItem(
    bigPhoto: 'assets/9.png',
    outlinePhoto: 'assets/line9.png',
    winOutlinePhoto: 'assets/win9.png',
  ),
  CharacterItem(
    bigPhoto: 'assets/10.png',
    outlinePhoto: 'assets/line10.png',
    winOutlinePhoto: 'assets/win10.png',
  ),
  CharacterItem(
    bigPhoto: 'assets/11.png',
    outlinePhoto: 'assets/line11.png',
    winOutlinePhoto: 'assets/win11.png',
  ),
  CharacterItem(
    bigPhoto: 'assets/12.png',
    outlinePhoto: 'assets/line12.png',
    winOutlinePhoto: 'assets/win12.png',
  ),
];

List<CharacterItem> currentCharacters = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  CarouselController carouselController = CarouselController();
  EChooseType selected = EChooseType.line;
  CharacterItem characterForRemove = CharacterItem();
  CharacterItem selectedCharacter = CharacterItem();
  List<CombinationItem> combinations = [
    CombinationItem(name: 'Flush', image: 'assets/flush.png'),
    CombinationItem(name: 'Four of a King', image: 'assets/four_of_king.png'),
    CombinationItem(name: 'Full house', image: 'assets/full_house.png'),
    CombinationItem(name: 'High card', image: 'assets/high_card.png'),
    CombinationItem(name: 'Two pair', image: 'assets/two_pairs.png'),
    CombinationItem(name: 'Straight', image: 'assets/straight.png'),
    CombinationItem(name: 'Pair', image: 'assets/pair.png'),
    CombinationItem(name: 'Pair', image: 'assets/pair2.png'),
    CombinationItem(name: 'Nothing', image: 'assets/nothing1.png'),
    CombinationItem(name: 'Nothing', image: 'assets/nothing2.png'),
    CombinationItem(name: 'Set', image: 'assets/set.png'),
  ];
  int initialPage = 0;
  @override
  void initState() {
    super.initState();
    currentCharacters = [];
    characters.shuffle();
    for (var i = 0; i < 3; i++) {
      currentCharacters.add(characters.elementAt(i));
    }
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
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SettingsPage()),
                );
              },
              child: const Row(
                children: [
                  Text(
                    'Settings',
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
                  'CHARACTERS',
                  style: TextStyle(
                      fontFamily: 'IBMPlexSansHebrew',
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          if (page == 0)
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 16, right: 16),
                    child: Container(
                      width: double.infinity,
                      height: 210,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/home.png'))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            'You don’t choose character yet.To start the game, first you need to select a character',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'IBMPlexSansHebrew',
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ),
          if (page == 1)
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getCurrentCharacters(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CarouselSlider(
                              carouselController: carouselController,
                              items: getCharacters(),
                              options: CarouselOptions(
                                // /aspectRatio: 1,
                                aspectRatio: 16 / 9,
                                viewportFraction: 1,
                                initialPage: 1,
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
                  ],
                ),
              ),
            ),
          if (page == 2)
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (selected == EChooseType.line)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CarouselSlider(
                                carouselController: carouselController,
                                items: getAllCharactersList(),
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
                    if (selected == EChooseType.grid)
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 30, left: 16, right: 16),
                        child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            decoration: BoxDecoration(
                                color: const Color(0xFF5A1AC3).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(30)),
                            child: getAllCharacters()),
                      ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              selected = EChooseType.grid;
                              setState(() {});
                            },
                            child: Image.asset(
                              selected == EChooseType.grid
                                  ? 'assets/grid_white.png'
                                  : 'assets/grid.png',
                              scale: 3.0,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              selected = EChooseType.line;
                              setState(() {});
                            },
                            child: Image.asset(
                              selected == EChooseType.line
                                  ? 'assets/line_white.png'
                                  : 'assets/line.png',
                              color: selected == EChooseType.line
                                  ? Colors.white
                                  : null,
                              scale: 3.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getCurrentCharacters(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (page == 0 || page == 1)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
              child: InkWell(
                onTap: () {
                  if (page == 0) {
                    page = 1;
                    setState(() {});
                  } else if (page == 1) {
                    page = 2;
                    setState(() {});
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color(0xFF5A1AC3),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text(
                    'CHOOSE CHARACTER',
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
          if (page == 2)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
              child: InkWell(
                onTap: () {
                  if (selected == EChooseType.line &&
                      characterForRemove.bigPhoto != null) {
                    currentCharacters.add(characters
                        .where((element) =>
                            element.bigPhoto !=
                                currentCharacters.elementAt(0).bigPhoto &&
                            element.bigPhoto !=
                                currentCharacters.elementAt(1).bigPhoto &&
                            element.bigPhoto !=
                                currentCharacters.elementAt(2).bigPhoto)
                        .elementAt(initialPage));
                    currentCharacters.remove(characterForRemove);
                    setState(() {});
                  } else {
                    if (characterForRemove.bigPhoto != null) {
                      currentCharacters.remove(characterForRemove);
                      currentCharacters.add(selectedCharacter);
                      setState(() {});
                    }
                  }
                  characterForRemove = CharacterItem();
                  selectedCharacter = CharacterItem();
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color(0xFF5A1AC3),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    'CHOOSE',
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
          if (page == 0 || page == 1)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: InkWell(
                onTap: () {
                  for (var player in currentCharacters) {
                    player.currentHand = combinations
                        .elementAt(Random().nextInt(combinations.length));
                    combinations.removeWhere(
                      (element) => element.name == player.currentHand!.name!,
                    );
                  }
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const GamePage()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: page == 0
                          ? Colors.white.withOpacity(0.5)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    'Play',
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
          if (page == 2)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: InkWell(
                onTap: () {
                  for (var player in currentCharacters) {
                    player.currentHand =
                        combinations.elementAt(Random().nextInt(11));
                  }
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const GamePage()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    'Done',
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
        ],
      ),
    ));
  }

  List<Widget> getCharacters() {
    List<Widget> list = [];
    for (var character in currentCharacters) {
      list.add(InkWell(
        onTap: () {
          currentCharacters.remove(characterForRemove);
          currentCharacters.add(character);
          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xFF5a1ac3),
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(image: AssetImage(character.bigPhoto!))),
        ),
      ));
    }
    return list;
  }

  List<Widget> getAllCharactersList() {
    List<Widget> list = [];
    for (var character in characters.where((element) =>
        element.bigPhoto != currentCharacters.elementAt(0).bigPhoto &&
        element.bigPhoto != currentCharacters.elementAt(1).bigPhoto &&
        element.bigPhoto != currentCharacters.elementAt(2).bigPhoto)) {
      list.add(Container(
        decoration: BoxDecoration(
            color: const Color(0xFF5a1ac3),
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(image: AssetImage(character.bigPhoto!))),
      ));
    }
    return list;
  }

  Widget getAllCharacters() {
    List<Widget> list = [];
    for (var character in characters) {
      list.add(InkWell(
        onTap: () {
          selectedCharacter = character;
          setState(() {});
        },
        child: Image.asset(
          selectedCharacter == character
              ? character.winOutlinePhoto!
              : character.outlinePhoto!,
          scale: 4.5,
        ),
      ));
    }
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      runSpacing: 20,
      children: list,
    );
  }

  Widget getCurrentCharacters() {
    List<Widget> list = [];
    for (var character in currentCharacters) {
      list.add(InkWell(
        onTap: () {
          if (page != 1) {
            characterForRemove = character;
            setState(() {});
          }
        },
        child: Image.asset(
          characterForRemove == character
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
      children: list,
    );
  }
}

Future<void> addToSP() async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString('user', jsonEncode(user));
}

void getSP(Function() callBack) async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getString('user') != null) {
    Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
    user = UserItem.fromJson(userMap);
  }

  callBack();
}
