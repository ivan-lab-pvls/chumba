import 'package:chumba_app/model/character_item.dart';
import 'package:chumba_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class FinalGamePage extends StatefulWidget {
  const FinalGamePage({super.key});

  @override
  State<FinalGamePage> createState() => _FinalGamePageState();
}

class _FinalGamePageState extends State<FinalGamePage> {
  CharacterItem selected = currentCharacters.first;
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
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 75, 16, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Winner',
                  style: TextStyle(
                      fontFamily: 'IBMPlexSansHebrew',
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  color: const Color(0xFF5a1ac3),
                  borderRadius: BorderRadius.circular(30),
                  image:
                      DecorationImage(image: AssetImage(selected.bigPhoto!))),
            ),
          ),
          getCurrentCharacters(),
          if (selected.currentHand != selected.userChosenHand)
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Text(
                'Player won because he had the best pair. He managed to hide his cards and use this to win',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'IBMPlexSansHebrew',
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w400),
              ),
            ),
          if (selected.currentHand == selected.userChosenHand)
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Text(
                'Player lost. He didn\'t manage to hide his cards and use this to win',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'IBMPlexSansHebrew',
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w400),
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
            child: InkWell(
              onTap: () {
                currentCharacters = [];
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                    (route) => false);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0xFF5A1AC3),
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  'Menu',
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
      list.add(InkWell(
        onTap: () {
          selected = character;
          setState(() {});
        },
        child: Image.asset(
          selected == character
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
