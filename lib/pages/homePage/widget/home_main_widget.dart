import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/api/api.dart';
import 'package:newsapp/api/api_news.dart';
import 'package:newsapp/model/api_model.dart';
import 'package:newsapp/model/api_news_model.dart';
import 'package:newsapp/pages/homePage/widget/newspost.dart';
import 'package:newsapp/pages/individualNewsFeed/individual_news_feed.dart';
import '../../../core/oval_gesture_button.dart';
import '../../../data/news_data.dart';
import '../../../model/news_model.dart';

class HomeMainWidget extends StatefulWidget {
  const HomeMainWidget({super.key});

  @override
  State<HomeMainWidget> createState() => _HomeMainWidgetState();
}

class _HomeMainWidgetState extends State<HomeMainWidget> {
  late Future<List<ApiNewsModel>?> future;

  //--------------- earlier ma banako apicall ko lage -------------------//

  final ApiCall _apiCall = ApiCall();
  List<ApiModel>? apiItem;
  void getData() async {
    isloading = true;
    final data = await _apiCall.fetchListData();
    apiItem = data;
    setState(() {
      isloading = false;
    });
  }

//-------------------------------------------------------------------------//

// sir le dinu vako api ko
  final ApiNews _apinews = ApiNews();
  List<ApiNewsModel>? latestApiNewsItem;
  void latestGetData() async {
    print("latestGetData");
    final List<ApiNewsModel>? data = await _apinews.fetchNews();
    latestApiNewsItem = data;
    if (latestApiNewsItem != null) {
      print(latestApiNewsItem);
    } else {
      print('null');
    }
  }

  //============================================================================//
  int currentIndex = 0;

  CarouselController carouselController = CarouselController();

  bool isloading = false;
  @override
  void initState() {
    super.initState();
    getData();
    future = _apinews.fetchNews();
    print(apiItem);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.only(left: 5.0, right: 2),
        height: height,
        child: Center(
          child: FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Something went error'),
                  );
                } else {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      CarouselSlider(
                        carouselController: carouselController,
                        options: CarouselOptions(
                          viewportFraction: 0.9,
                          enlargeFactor: 0.2,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            currentIndex = 0;

                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                        items: snapshot.data!.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const IndividualNewsFeed();
                                      },
                                      settings: RouteSettings(arguments: i),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 2),
                                  width: width,
                                  height: height * 0.25,
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(0.0, 1.0),
                                          blurRadius: 0.5)
                                    ],
                                    color: Colors.red,
                                    image: DecorationImage(
                                        image: NetworkImage(i.urlToImage ??
                                            'https://imgs.search.brave.com/PuHnVwOVe_FMC6SDGd7sHndx__6mDPhD7CJo5tuQ6LE/rs:fit:500:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzA1LzA0LzI4Lzk2/LzM2MF9GXzUwNDI4/OTYwNV96ZWhKaUsw/dEN1WkxQMk1kZkZC/cGNKZE9WeEtMblhn/MS5qcGc'),
                                        fit: BoxFit.cover),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Spacer(),
                                      // i.category != null
                                      //     ? SizedBox(
                                      //         width: 90,
                                      //         child: OvalGestureButton(
                                      //           text: i.getCategoryName,
                                      //           backgroundColorBtn:
                                      //               Colors.white,
                                      //           textColor: const Color.fromARGB(
                                      //               255, 29, 154, 33),
                                      //           horizontalPadding: 8,
                                      //           verticalPadding: 2,
                                      //           textSize: 12,
                                      //         ),
                                      //       )
                                      //     : const SizedBox(
                                      //         height: 2,
                                      //       ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        i.title ?? 'no title',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                        maxLines: 3,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: NetworkImage(i
                                                    .urlToImage ??
                                                'https://imgs.search.brave.com/PuHnVwOVe_FMC6SDGd7sHndx__6mDPhD7CJo5tuQ6LE/rs:fit:500:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzA1LzA0LzI4Lzk2/LzM2MF9GXzUwNDI4/OTYwNV96ZWhKaUsw/dEN1WkxQMk1kZkZC/cGNKZE9WeEtMblhn/MS5qcGc'),
                                            radius: 15,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            i.author ?? 'no author',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        // color: Colors.red,
                        height: 30,
                        child: Row(
                          children: [
                            //list generate
                            ...newsData.asMap().entries.map((e) {
                              return Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 3,
                                    decoration: BoxDecoration(
                                        color: currentIndex == e.key
                                            ? Colors.green
                                            : Colors.grey),
                                    // child: Text('e.key'),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  )
                                ],
                              );
                            }).toList()
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        // color: Colors.red,
                        height: 40,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Row(
                                children: [
                                  OvalGestureButton(
                                      onTap: () {
                                        latestGetData();
                                      },
                                      text: 'Hot News',
                                      backgroundColorBtn: const Color.fromARGB(
                                          255, 29, 154, 33),
                                      textColor: Colors.white,
                                      textSize: 15,
                                      horizontalPadding: 12,
                                      verticalPadding: 2),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  ...Category.values
                                      .map(
                                        (e) => Row(
                                          children: [
                                            SizedBox(
                                              // color: Colors.red,
                                              height: 40,
                                              // width: double.infinity,
                                              child: OvalGestureButton(
                                                  text:
                                                      '${e.name[0].toUpperCase()}${e.name.substring(1).toLowerCase()}',
                                                  backgroundColorBtn:
                                                      const Color.fromARGB(
                                                          71, 216, 211, 211),
                                                  textColor: Colors.grey,
                                                  textSize: 15,
                                                  horizontalPadding: 12,
                                                  verticalPadding: 2),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            )
                                          ],
                                        ),
                                      )
                                      .toList(),
                                ],
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: newsData.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const IndividualNewsFeed();
                                      },
                                      settings: RouteSettings(
                                          arguments: newsData[index]),
                                    ),
                                  );
                                },
                                child: NewsPost(
                                  sideImage: newsData[index].newsImage,
                                  authorImage: newsData[index].authorProfile,
                                  highlight: apiItem?[index].title ?? 'null',
                                  publishedDate:
                                      newsData[index].intlFormatedDate,
                                  authorName: newsData[index].author,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      )
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}
