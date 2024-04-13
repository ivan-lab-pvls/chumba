class UserItem {
  bool? soundOn;
  bool? notifOn;

  UserItem({this.soundOn, this.notifOn});

  factory UserItem.fromJson(Map<String, dynamic> parsedJson) {
    return UserItem(
      soundOn: parsedJson['soundOn'],
      notifOn: parsedJson['notifOn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"soundOn": soundOn, "notifOn": notifOn};
  }
}
