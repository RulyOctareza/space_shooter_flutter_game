class GameData {
  late int _score;
  late int _lives;

  GameData(this._score, this._lives);

  int get score => _score;
  int get lives => _lives;

  void addScore(int score) {
    _score += score;
  }

  void addlives(int lives) {
    _lives += lives;
  }

  void loselives() {
    _lives--;
  }
}
