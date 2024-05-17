import 'package:flutter/material.dart';
import 'package:newsapp/model/api_news_model.dart';
// import 'package:newsapp/model/news_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/news_data.dart';

class IndividualNewsFeed extends StatelessWidget {
  const IndividualNewsFeed({super.key});

  @override
  Widget build(BuildContext context) {
    ApiNewsModel news =
        ModalRoute.of(context)?.settings.arguments as ApiNewsModel;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;
    print('----------------');
    print(news.urlToImage);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(children: const [
            Spacer(),
            Text(
              'Happy Reading',
              style: TextStyle(color: Colors.black),
            ),
            Spacer(),
            CircleAvatar(
              backgroundColor: Color.fromARGB(71, 216, 211, 211),
              child: Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
              ),
            ),
          ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              CachedNetworkImage(
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                imageUrl: news.urlToImage ??
                    'https://imgs.search.brave.com/uE_DdVpJM0Iy4lFFuHA9XkGwpclj-6soFg951V6SoyI/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9zdC5k/ZXBvc2l0cGhvdG9z/LmNvbS8xMDIwNDgy/LzMwODgvaS80NTAv/ZGVwb3NpdHBob3Rv/c18zMDg4NDY4NS1z/dG9jay1pbGx1c3Ry/YXRpb24tNDA0LWVy/cm9yLXBhZ2Utbm90/LWZvdW5kLmpwZw',
                imageBuilder: ((context, imageProvider) => Container(
                      width: width,
                      height: 200,
                      padding: const EdgeInsets.only(top: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: const [
                          BoxShadow(offset: Offset(0.0, 1.0), blurRadius: 0.5)
                        ],
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.fill),
                      ),
                    )),
              ),
              // Container(
              //   width: width,
              //   height: height * 0.5,
              //   padding: const EdgeInsets.only(top: 10, right: 10),
              //   decoration: BoxDecoration(
              //     boxShadow: const [
              //       BoxShadow(offset: Offset(0.0, 1.0), blurRadius: 0.5)
              //     ],
              //     // color: Colors.red,
              //     image: DecorationImage(
              //         image:CachedNetworkImageProvider(news.urlToImage ?? 'https://imgs.search.brave.com/uE_DdVpJM0Iy4lFFuHA9XkGwpclj-6soFg951V6SoyI/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9zdC5k/ZXBvc2l0cGhvdG9z/LmNvbS8xMDIwNDgy/LzMwODgvaS80NTAv/ZGVwb3NpdHBob3Rv/c18zMDg4NDY4NS1z/dG9jay1pbGx1c3Ry/YXRpb24tNDA0LWVy/cm9yLXBhZ2Utbm90/LWZvdW5kLmpwZw') , fit: BoxFit.cover),
              //     borderRadius: const BorderRadius.all(
              //       Radius.circular(20),
              //     ),
              //   ),
              //   // child: Row(
              //   //   crossAxisAlignment: CrossAxisAlignment.start,
              //   //   children: [
              //   //     const Spacer(),
              //   //     // news.category!=null?
              //   //     // SizedBox(
              //   //     //   // color: Colors.red,
              //   //     //   width: 90,
              //   //     //   height: 25,
              //   //     //   child: OvalGestureButton(
              //   //     //     text: news.getCategoryName,
              //   //     //     backgroundColorBtn: Colors.white,
              //   //     //     textColor: const Color.fromARGB(255, 29, 154, 33),
              //   //     //     horizontalPadding: 12,
              //   //     //     verticalPadding: 6,
              //   //     //     textSize: 12,
              //   //     //   ),
              //   //     // ):const SizedBox(height: 2,),
              //   //   ],
              //   // ),
              // ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      // padding: const EdgeInsets.symmetric(horizontal: 20),
                      // color: Colors.red,
                      // width: width,
                      child: Text(
                        newsData[0].newsTitle,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 0.1,
                            letterSpacing: 0.1),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(news
                                  .urlToImage ??
                              'https://imgs.search.brave.com/K3qeJtm_up-upl3RLJWUvn5gAAdCoNqMoXs5Gox95xU/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/cHVibGljZG9tYWlu/cGljdHVyZXMubmV0/L3BpY3R1cmVzLzI4/MDAwMC92ZWxrYS9u/b3QtZm91bmQtaW1h/Z2UtMTUzODM4NjQ3/ODdsdS5qcGc'),
                          radius: 12,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          newsData[0].author,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.grey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          (news.publishedAt).toString(),
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      news.content ?? 'null',
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      // height: 20,
                      // color: Colors.red,
                      child: Center(
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              const VerticalDivider(
                                color: Colors.green,
                                thickness: 2,
                                width: 20,
                              ),
                              Expanded(
                                child: Text(
                                  news.title ?? 'null',
                                  style: const TextStyle(color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(news.description ?? 'null')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
