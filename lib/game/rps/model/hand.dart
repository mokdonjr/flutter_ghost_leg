class Hand {
  HandType _handType;

  Hand(this._handType);

  HandType get handType => _handType;
}

enum HandType {
  none,
  rock,
  paper,
  scissors,
}

extension HandTypeExtension on HandType {

  String getDisplayName() {
    switch (this) {
      case HandType.none: return 'None';
      case HandType.rock: return 'Rock';
      case HandType.paper: return 'Paper';
      case HandType.scissors: return 'Scissors';
    }
  }

  String getAssetName() {
    switch (this) {
      case HandType.none: return '';
      case HandType.rock: return 'images/scene/rps/rock.png';
      case HandType.paper: return 'images/scene/rps/paper.png';
      case HandType.scissors: return 'images/scene/rps/scissors.png';
    }
  }
}