import 'package:audio_player/pages/home.dart';
import 'package:audio_player/pages/music.dart';
import 'package:audio_player/pages/player.dart';
import 'package:audio_player/utils/constants.dart';
import 'package:flutter/material.dart';

class AppStructure extends StatefulWidget {
  const AppStructure({super.key});

  @override
  State<AppStructure> createState() => _AppStructureState();
}

class _AppStructureState extends State<AppStructure> {
  int currentIndex = 0;
  final screens = const [
    HomePage(),
    MusicList(),
    PlayerPage(),
  ];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: screens[currentIndex], //Não mantém o estado atual da página
      body: isLoading
          ? Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [primary, gradient])),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Olá,",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Ouvinte",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          : IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: isLoading
          ? null
          : BottomNavigationBar(
              currentIndex: currentIndex,
              type: BottomNavigationBarType.shifting,
              onTap: (index) => setState(() => currentIndex = index),
              selectedItemColor: const Color(0xFFFFFFFF),
              unselectedItemColor: const Color(0xFFFFFFFF),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                    backgroundColor: Color(0xFF8080FF)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.music_note),
                    label: "List",
                    backgroundColor: Color(0xFF8080FF)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.play_arrow),
                    label: "Player",
                    backgroundColor: Color(0xFF8080FF)),
              ],
            ),
    );
  }
}
