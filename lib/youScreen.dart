import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:lunch_partner/adminHome.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouScreen extends StatefulWidget {
  const YouScreen({Key? key}) : super(key: key);

  @override
  State<YouScreen> createState() => _YouScreenState();
}

class _YouScreenState extends State<YouScreen> {
  late YoutubePlayerController ytController;
  TextEditingController linkController = TextEditingController();

  @override
  void initState() {
    ytController = YoutubePlayerController(
      initialVideoId: 'pswdTJ59fdQ',
      flags:
          const YoutubePlayerFlags(autoPlay: false, mute: false, startAt: 20),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        YoutubePlayer(
          controller: ytController,
          showVideoProgressIndicator: true,
        ),
        TextFormField(
          controller: linkController,
          decoration: const InputDecoration(hintText: "past a link"),
        ),
        GestureDetector(
          onTap: () {
            ytController
                .load(YoutubePlayer.convertUrlToId(linkController.text)!);
          },
          child: Container(
            height: 50,
            width: 120,
            color: Colors.blueAccent,
            child: const Center(
              child: Text("Add Video"),
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(
              height: 60,
              width: 350,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AdminHome()));
                  },
                  child: Text("OK")),
            ),
          ],
        )
      ]),
    );
  }
}
