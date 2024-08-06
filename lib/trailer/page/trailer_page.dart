import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviemot/home/bloc/home_bloc.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class TrailerPage extends StatefulWidget {
  const TrailerPage({super.key});

  @override
  State<TrailerPage> createState() => _TrailerPageState();
}

class _TrailerPageState extends State<TrailerPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final select = context.read<HomeBloc>().state.videos;
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: select.first.key,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
    _controller.playVideo();
  }

  @override
  void dispose() {
    _controller.stopVideo();
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: YoutubePlayerScaffold(
          controller: _controller,
          aspectRatio: 16 / 9,
          builder: (context, player) {
            return player;
          },
        ),
      ),
    );
  }
}
