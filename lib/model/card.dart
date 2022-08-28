class Card {
  final String imagePath;
  final String title;

  Card({required this.imagePath, required this.title});
}

List<Card> cards = [
  Card(imagePath: "assets/images/image_01.png", title: "Hounted Ground"),
  Card(imagePath: "assets/images/image_02.jpg", title: "Fallen In Love"),
  Card(imagePath: "assets/images/image_03.jpg", title: "The Dreaming Moon"),
  Card(
    imagePath: "assets/images/image_04.jpg",
    title: "Jack the Persian and the Black Castel",
  ),
];
