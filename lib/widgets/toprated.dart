import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import '../description.dart';

class TopRated extends StatelessWidget {
  final List? topRated;

  TopRated({this.topRated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Top Rated Movies',
            size: 26,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
                itemCount: topRated!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                  name: topRated![index]['title'],
                                  bannerUrl:
                                      'https://image.tmdb.org/t/p/w500/' +
                                          topRated![index]['backdrop_path'],
                                  posterUrl:
                                      'https://image.tmdb.org/t/p/w500/' +
                                          topRated![index]['poster_path'],
                                  description: topRated![index]['overview'],
                                  vote: topRated![index]['vote_average'],
                                  launchOn: topRated![index]['release_date'],
                                )),
                      );
                    },
                    child: topRated![index]['title'] != null
                        ? SizedBox(
                            width: 140,
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500/' +
                                              topRated![index]['poster_path']),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ModifiedText(
                                  text: topRated![index]['title'] ?? 'Loading',
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
