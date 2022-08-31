import 'package:flutter/material.dart';
import 'package:untitled13/design/body_design.dart';
import 'package:video_player/video_player.dart';


class MyVedio extends StatefulWidget {
  const MyVedio({Key? key}) : super(key: key);

  @override
  State<MyVedio> createState() => _MyVedioState();
}

class _MyVedioState extends State<MyVedio> {
  VideoPlayerController? controller;
  String assets = "assets/my_video.mp4";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.asset(assets)
      ..initialize().then((_) {
        setState(() {});
      });
    controller!.play();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          // fit: StackFit.expand,
          children: [
            controller!.value.isInitialized
                ? Container(
                    height: double.infinity, child: VideoPlayer(controller!))
                : Container(
                    height: 200,
                    width: double.infinity,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
            const PostContent()
          ],
        ),
      ),
    );
  }
}




