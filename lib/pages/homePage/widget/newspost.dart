import 'package:flutter/material.dart';

class NewsPost extends StatelessWidget {
  const NewsPost({
    required this.sideImage,
    required this.authorImage,
    required this.highlight,
    required this.publishedDate,
    required this.authorName,
    super.key,
  });
  final String sideImage;
  final String authorImage;
  final String highlight;
  final String publishedDate;
  final String authorName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(sideImage), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: SizedBox(
              // color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(authorImage),
                        radius: 12,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        authorName,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    highlight,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(publishedDate)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
