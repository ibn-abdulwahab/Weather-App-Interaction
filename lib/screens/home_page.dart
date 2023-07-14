import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:line_icons/line_icons.dart';
import 'package:video_player/video_player.dart';

import 'components/icon_label_and_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? currentPageValue = 0;

  final _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.addListener(() {
        setState(() {
          currentPageValue = _controller.page;
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List pages = [
    const PageWidget(),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.brown,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          print(index);
          print(currentPageValue);
          return pages[index];
        },
      ),
    );
  }
}

class PageWidget extends StatefulWidget {
  const PageWidget({super.key});

  @override
  State<PageWidget> createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/cloudy.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: const Color.fromRGBO(169, 135, 177, 1),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lafia city',
                      style: textTheme.headlineSmall,
                    ),
                    Text(
                      'Today, Aug 28, 10:35',
                      style: textTheme.labelSmall,
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_rounded),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu_rounded),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RepaintBoundary(
                      child: const Icon(LineIcons.cloud)
                          .animate(delay: 500.ms)
                          .slideY(),
                    ),
                    RepaintBoundary(
                      child: const Text('Mostly\ncloudy')
                          .animate(
                            delay: 500.ms,
                          )
                          .slideY(begin: 1, duration: 1000.ms)
                          .fadeIn(duration: 1000.ms)
                          .then()
                          .shakeY(duration: 500.ms, amount: 1),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  '34',
                  style: textTheme.displayLarge,
                ),
                Text(
                  'o',
                  style: textTheme.titleLarge,
                ),
              ],
            ),
          ),
          const Spacer(),
          if (_controller.value.isInitialized)
            RepaintBoundary(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ).animate().slide(
                      begin: const Offset(1, 0.1),
                      curve: Curves.easeIn,
                    ),
              ),
            ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
              top: 15,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      'Weather now',
                      style: textTheme.headlineSmall,
                    ),
                    const Spacer(),
                    const RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 16,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                RepaintBoundary(
                  child: const Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconLabelAndText(
                            icon: LineIcons.highTemperature,
                            label: 'Temperature',
                            text: '34',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          IconLabelAndText(
                            icon: LineIcons.meteor,
                            label: 'Perception',
                            text: '50%',
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconLabelAndText(
                            icon: Icons.wind_power_outlined,
                            label: 'Wind',
                            text: '10 km/h',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          IconLabelAndText(
                            icon: LineIcons.tint,
                            label: 'Humidity',
                            text: '89%',
                          ),
                        ],
                      ),
                      SizedBox(width: 30)
                    ],
                  )
                      .animate()
                      .slideX(delay: 500.ms, duration: 500.ms, begin: 1.3),
                ),
                const SizedBox(height: 20),
                const LinearProgressIndicator(
                  value: 0.3,
                  color: Colors.grey,
                ),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    Text('Now'),
                    SizedBox(width: 15),
                    Text(
                      'Hourly',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Daily',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}