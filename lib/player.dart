class BGPlayer {
  String name;
  String avatar;
  int _score = 0;

  int get score => _score;

  set score(int value) {
    _score = value;
  }

  BGPlayer(this.name, this.avatar);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'avatar': avatar,
      'score': _score,
    };
  }


}