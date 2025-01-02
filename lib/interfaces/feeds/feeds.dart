import 'package:card_swiper/card_swiper.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orayemem/interfaces/feeds/widgts/comment_section.dart';
import 'package:orayemem/interfaces/feeds/widgts/content_screen.dart';
import 'package:orayemem/models/feeds.dart';
import 'package:orayemem/models/restuarnts.dart';
import 'package:video_player/video_player.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  List<String> images = [
    "me.jpeg",
    "image1.jpeg",
    "image2.jpeg",
  ];
  List<Feeds> feeds = [
    Feeds(
        videoUrl:
            "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        id: "0",
        desc:
            "It’s a great experience. The ambiance is very welcoming and charming",
        restuarnt_name: "EL PADRE",
        profile_url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlk4oNwa7YRo9hzCaxIWShtmV28ZXPzmaR5Sd3ohFvPbVb2QD7KhMVNFWzesS9I9H1XV0&usqp=CAU",
        isLiked: false),
    Feeds(
        videoUrl:
            "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        id: "0",
        desc:
            "It’s a great experience. The ambiance is very welcoming and charming",
        restuarnt_name: "Le Cartel Sandwicherie",
        profile_url:
            "https://i1.sndcdn.com/avatars-000648892797-ituahv-t500x500.jpg",
        isLiked: false),
    Feeds(
        videoUrl:
            "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        id: "0",
        desc:
            "It’s a great experience. The ambiance is very welcoming and charming",
        restuarnt_name: "EL PADRE",
        profile_url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlk4oNwa7YRo9hzCaxIWShtmV28ZXPzmaR5Sd3ohFvPbVb2QD7KhMVNFWzesS9I9H1XV0&usqp=CAU",
        isLiked: false),
    Feeds(
        videoUrl:
            "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        id: "0",
        desc:
            "It’s a great experience. The ambiance is very welcoming and charming",
        restuarnt_name: "O'Tacos Dz",
        profile_url:
            "https://i0.wp.com/www.visa-algerie.com/wp-content/uploads/2020/07/Otacos.jpg?w=568",
        isLiked: false),
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF292D32),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Swiper(
                itemCount: feeds.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return ContentScreen(
                    feed: feeds[index],
                  );
                }),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/video-play.svg",
                        height: 24,
                        color: const Color(0xffFA5B01),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Feeds",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      reactButtons("notification", () {}),
                      reactButtons("bag-2", () {}),
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
