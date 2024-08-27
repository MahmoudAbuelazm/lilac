import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../data/models/service_model.dart';

class ServiceVideoItem extends StatefulWidget {
  final Result service;

  const ServiceVideoItem({super.key, required this.service});

  @override
  State<ServiceVideoItem> createState() => _ServiceVideoItemState();
}

class _ServiceVideoItemState extends State<ServiceVideoItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.service.video.url),
    )..initialize().then((_) {
        setState(
            () {}); // Ensure the first frame is shown after the video is initialized.
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  void _restart() {
    _controller.seekTo(Duration.zero);
    _controller.play();
  }

  void _enterFullScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenVideoPlayer(controller: _controller),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: 300.w, // Set the desired width using ScreenUtil
          height: 200.h, // Set the desired height using ScreenUtil
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : const Center(child: const CircularProgressIndicator()),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: _togglePlayPause,
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: _restart,
            ),
            IconButton(
              icon: const Icon(Icons.fullscreen),
              onPressed: _enterFullScreen,
            ),
          ],
        ),
      ],
    );
  }
}

class FullScreenVideoPlayer extends StatelessWidget {
  final VideoPlayerController controller;

  const FullScreenVideoPlayer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.fullscreen_exit),
      ),
    );
  }
}
