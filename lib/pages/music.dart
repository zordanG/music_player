import 'package:audio_player/providers/music.dart';
import 'package:audio_player/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicList extends StatefulWidget {
  const MusicList({super.key});

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  int lastIndex = 0;

  void startAudio() async {}

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // startAudio();
    return Scaffold(
      body: Container(
        color: const Color(0xFF333333),
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Row(children: [
                const SizedBox(
                  width: 10,
                  height: 100,
                ),
                Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      border:
                          Border.all(width: 1, color: const Color(0xFF666666))),
                  child: const Icon(
                    Icons.music_note,
                    color: Color(0xFF666666),
                    size: 40,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    Text(
                      list[index].name,
                      style: const TextStyle(color: Colors.white, fontSize: 26),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      list[index].author,
                      style: TextStyle(color: Colors.grey[400], fontSize: 18),
                    ),
                  ],
                ),
                // OutlinedButton(
                //     onPressed: () {
                //       Provider.of<MusicChange>(context, listen: false)
                //           .chageMusic(index);
                //     },
                //     style: const ButtonStyle(
                //       backgroundColor: MaterialStatePropertyAll(primary),
                //     ),
                //     child: const Text(
                //       "Ouvir",
                //       style: TextStyle(color: Colors.white),
                //     )),
              ]);
            }),
      ),
    );
  }
}
