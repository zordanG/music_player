import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Bem vindo ao seu app de músicas",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 42),
        ),
        SvgPicture.asset("svgs/music.svg")
      ],
    );
  }
}
