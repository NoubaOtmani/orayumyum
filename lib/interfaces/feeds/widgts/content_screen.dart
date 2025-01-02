import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orayemem/interfaces/feeds/widgts/comment_section.dart';
import 'package:orayemem/interfaces/feeds/widgts/like_icon.dart';
import 'package:orayemem/interfaces/feeds/widgts/options_screen.dart';
import 'package:orayemem/models/feeds.dart';
import 'package:video_player/video_player.dart';

class ContentScreen extends StatefulWidget {
  final Feeds feed;
  const ContentScreen({Key? key, required this.feed}) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  PageController pageController = PageController();
  bool _liked = false;

  Future initializePlayer() async {
    try {
      _videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(widget.feed.videoUrl));
      await Future.wait([_videoPlayerController.initialize()]);
      initChewie();
    } catch (e) {
      print(e);
    }
  }

  initChewie() {
    _chewieController = ChewieController(
      aspectRatio: MediaQuery.of(context).size.aspectRatio,
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
    );
    setState(() {});
  }

  @override
  void initState() {
    initializePlayer();

    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  Widget reactButtons(String iconName, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        height: 33,
        width: 33,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.1),
        ),
        child: MaterialButton(
          padding: EdgeInsets.zero,
          elevation: 0,
          onPressed: () {
            onTap();
          },
          child: SvgPicture.asset(
            "assets/icons/$iconName.svg",
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void showModal(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: const CommentsSectionScreen());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            _chewieController != null &&
                    _chewieController!.videoPlayerController.value.isInitialized
                ? GestureDetector(
                    onVerticalDragDown: (dragDown) {},
                    onDoubleTap: () {
                      setState(() {
                        _liked = !_liked;
                      });
                    },
                    child: Chewie(
                      controller: _chewieController!,
                    ),
                  )
                : const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10),
                        Text(
                          'Loading...',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      const Color(0xff00000000).withOpacity(0.00),
                      const Color(0xff00000000).withOpacity(0.9)
                    ])),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                widget.feed.profile_url,
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.feed.restuarnt_name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/star.svg",
                                  color: const Color(0xffEEC110),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "4.6",
                                  style: TextStyle(
                                      color: Color(0xffD8D8D8), fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.feed.desc ?? "",
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          reactButtons("heartFill", () {}),
                          reactButtons("message-2", () {
                            showModal(context);
                          }),
                          reactButtons("send-2", () {}),
                        ],
                      ),
                      Container(
                        height: 33,
                        width: 146,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.1),
                        ),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          padding: EdgeInsets.zero,
                          elevation: 0,
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset(
                                "assets/icons/bag-2.svg",
                                height: 18,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "ADD TO CART",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
