import 'package:flutter/material.dart';
import 'dart:math';

import '../model/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

var cardAspecRatio = 12.0 / 16.0;
var widgetAspecRatio = cardAspecRatio * 1.2;

class _HomePageState extends State<HomePage> {
  double currentPage = cards.length - 1;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: cards.length - 1);
    controller.addListener(
      () => setState(() {
        currentPage = controller.page!.toDouble();
      }),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF2d3447),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Start: App bar
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 30.0, 12.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
            // End: App bar
            // Start: Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 46.0,
                        color: Colors.white,
                        letterSpacing: 1.0),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz,
                        color: Colors.white, size: 30.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22.0, vertical: 6.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFff6e6e),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Text(
                      'Animated',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    '25+ Stories',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
            // End: Title
            // Start: Cards
            Stack(
              children: [
                CardScrollWidget(currentPage: currentPage),
                Positioned.fill(
                  child: PageView.builder(
                    itemCount: cards.length,
                    controller: controller,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  ),
                ),
              ],
            ),
            // End: Cards
            // Start: Footer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Favourite',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 46.0,
                        color: Colors.white,
                        letterSpacing: 1.0),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz,
                        color: Colors.white, size: 30.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22.0, vertical: 6.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Text(
                      'Latest',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    '25+ Stories',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: SizedBox(
                      width: 296.0,
                      height: 222.0,
                      child: Image.asset(
                        "assets/images/image_02.jpg",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // End: Footer
          ],
        ),
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  CardScrollWidget({Key? key, required this.currentPage}) : super(key: key);
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspecRatio,
      child: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var height = constraints.maxHeight;

          var safeWidth = width - 2 * padding;
          var safeHeight = height - 2 * padding;

          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = heightOfPrimaryCard * cardAspecRatio;

          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizontalInset = primaryCardLeft / 2;

          List<Widget> cardList = [];

          for (int i = 0; i < cards.length; i++) {
            var delta = i - currentPage;
            bool isOnRight = delta > 0;
            var start = padding +
                max(
                    primaryCardLeft -
                        horizontalInset * -delta * (isOnRight ? 15 : 1),
                    0.0);
            var cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0.0),
              bottom: padding + verticalInset * max(-delta, 0.0),
              start: start,
              textDirection: TextDirection.rtl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(3.0, 6.0),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: AspectRatio(
                    aspectRatio: cardAspecRatio,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(cards[i].imagePath, fit: BoxFit.cover),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cards[i].title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                          fontSize: 25.0, color: Colors.white),
                                ),
                                const SizedBox(height: 10.0),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 6.0),
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: const Text(
                                    'Read Later',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
            cardList.add(cardItem);
          }
          return Stack(
            children: cardList,
          );
        },
      ),
    );
  }
}
