import 'package:better_player/better_player.dart';
import 'package:better_player_example/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NormalPlayerPage extends StatefulWidget {
  @override
  _NormalPlayerPageState createState() => _NormalPlayerPageState();
}

class _NormalPlayerPageState extends State<NormalPlayerPage> {
  late BetterPlayerController _betterPlayerController;
  late BetterPlayerDataSource _betterPlayerDataSource;

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
          autoPlay: true,
          controlsConfiguration: BetterPlayerControlsConfiguration(
            enableOverflowMenu: false,
            playerTheme: BetterPlayerTheme.material,
            enablePlayPause: false,
            enableSkips: false,
            showControls: true,
            showControlsOnInitialize: true,
            controlBarColor: Colors.transparent,
          ),
          systemOverlaysAfterFullScreen: [
            SystemUiOverlay.bottom,
            SystemUiOverlay.top,
          ],
          deviceOrientationsAfterFullScreen: [
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ],
          fit: BoxFit.fill,
          deviceOrientationsOnFullScreen: [
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ],
          showPlaceholderUntilPlay: true,
          aspectRatio: 16/9,
          autoDetectFullscreenAspectRatio: true,
          handleLifecycle: true,
    );
    _betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
        "https://video.piri.net/piri/upload/3/2023/10/24/611d4e2f-bahceli-yola-revan-lmazsam-namerdim/611d4e2f-bahceli-yola-revan-lmazsam-namerdim.m3u8",
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(_betterPlayerDataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Normal player page"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer(controller: _betterPlayerController),
          ),
        ],
      ),
    );
  }
}
