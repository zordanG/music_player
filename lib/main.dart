import 'package:audio_player/pages/app.dart';
import 'package:audio_player/providers/music.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => MusicChange(),
    child: const MaterialApp(
      title: "Meditate",
      home: AppStructure(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
