import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_player/providers/music.dart';
import 'package:audio_player/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  final player = AssetsAudioPlayer();
  bool isPlaying = false;
  bool needStart = true;
  int lastMusic = 1;

  @override
  Widget build(BuildContext context) {
    int index = Provider.of<MusicChange>(context).index;

    return Container(
      color: const Color(0xFF333333),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 25,
          ),
          Column(
            children: [
              Text(
                list[index].name,
                style: const TextStyle(color: Colors.white, fontSize: 36),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                list[index].author,
                style: TextStyle(color: Colors.grey[400], fontSize: 24),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: 120,
            height: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                border: Border.all(width: 1, color: const Color(0xFFAAAAAA))),
            child: const Icon(Icons.music_note,
                color: Color(0xFFAAAAAA), size: 60),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () async {
                  await player.previous();
                  if (index > 0) {
                    Provider.of<MusicChange>(context, listen: false)
                        .chageMusic(index - 1);
                  }
                  setState(() {
                    isPlaying = true;
                  });
                },
                icon: Icon(
                  Icons.skip_previous,
                  color: Colors.blue[800],
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: () async {
                  if (needStart) {
                    await player.open(Playlist(audios: [
                      Audio.network(list[0].path),
                      Audio.network(list[1].path),
                      Audio.network(list[2].path),
                    ]));
                    needStart = false;
                  }
                  if (isPlaying == true) {
                    setState(() {
                      isPlaying = false;
                    });
                    await player.pause();
                  } else {
                    setState(() {
                      isPlaying = true;
                    });
                    if (lastMusic != index) {
                      await player.playlistPlayAtIndex(index);
                      lastMusic = index;
                    } else {
                      await player.play();
                    }
                  }
                },
                icon: Icon(
                  isPlaying == true ? Icons.pause : Icons.play_arrow,
                  color: Colors.blue[800],
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: () async {
                  await player.next();
                  Provider.of<MusicChange>(context, listen: false)
                      .chageMusic(index < (list.length - 1) ? index + 1 : 0);
                  setState(() {
                    isPlaying = true;
                    index = index + 1;
                  });
                },
                icon: Icon(
                  Icons.skip_next,
                  color: Colors.blue[800],
                  size: 40,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
