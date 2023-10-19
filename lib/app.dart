import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int navBotIndex = 0;

  @override
  Widget build(BuildContext context) {
    const title = Text("Test");
    ScrollController scrollController = ScrollController();
    print('navindex: $navBotIndex');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: title,
        ),
        body: Stack(
          children: [
            NotificationListener(
              onNotification: (t) {
                return false;
              },
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: scrollController,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.verified,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('pressed!');
          },
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navBotIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.cabin), label: "Cabinet"),
          ],
          onTap: (int itemNumber) {
            print("pos: $scrollController.positions");
            scrollController.animateTo(
              MediaQuery.of(context).size.width * itemNumber,
              curve: Curves.bounceIn,
              duration: const Duration(milliseconds: 50),
            );
            setState(() {
              navBotIndex = itemNumber;
            });
            print("Drawer test");
            print(itemNumber);
          },
        ),
        drawer: const Drawer(
          child: Text("Yo", textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
