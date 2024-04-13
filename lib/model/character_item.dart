import 'package:chumba_app/model/combination_item.dart';

class CharacterItem {
  String? bigPhoto;
  String? outlinePhoto;
  String? winOutlinePhoto;
  CombinationItem? currentHand;
  CombinationItem? userChosenHand;

  CharacterItem(
      {this.bigPhoto,
      this.outlinePhoto,
      this.winOutlinePhoto,
      this.currentHand,
      this.userChosenHand});
}
