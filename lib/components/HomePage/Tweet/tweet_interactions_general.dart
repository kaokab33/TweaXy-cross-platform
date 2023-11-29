import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';

class TweetInteractions extends StatelessWidget {
  const TweetInteractions(
      {super.key,
      required this.likesCount,
      required this.viewsCount,
      required this.retweetsCount,
      required this.commentsCount});
  final int likesCount;
  final int viewsCount;
  final int retweetsCount;
  final int commentsCount;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                  FontAwesomeIcons.comment), // Replace with your desired icon
              SizedBox(
                  width: screenWidth *
                      0.009), // Adjust the width as per your preference
              Text(
                  commentsCount.toString()), // Replace with your desired label
            ],
          ),
          Row(
            children: [
              const Icon(FontAwesomeIcons.retweet), // Replace with your desired icon
              SizedBox(
                  width: screenWidth *
                      0.009), // Adjust the width as per your preference
              Text(
                  retweetsCount.toString()), // Replace with your desired label
            ],
          ),
          LikeButton(
              likeCount: likesCount,
              size: 20,
              likeCountPadding: EdgeInsets.only(left: screenWidth * 0.0009)),
          Row(
            children: [
              const Icon(Icons.bar_chart), // Replace with your desired icon
              SizedBox(
                  width: screenWidth *
                      0.009), // Adjust the width as per your preference
              Text(viewsCount.toString()), // Replace with your desired label
            ],
          ),
          // Replace with your desired icon
        ],
      ),
    );
  }
}
