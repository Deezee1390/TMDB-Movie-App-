import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List? trending;

  TrendingMovies({this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Trending Movies',
            size: 26,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
                itemCount: trending!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                  name: trending![index]['title'],
                                  bannerUrl:
                                      'https://image.tmdb.org/t/p/w500/' +
                                          trending![index]['backdrop_path'],
                                  posterUrl:
                                      'https://image.tmdb.org/t/p/w500/' +
                                          trending![index]['poster_path'],
                                  description: trending![index]['overview'],
                                  vote: trending![index]['vote_average'],
                                  launchOn: trending![index]['release_date'],
                                )),
                      );
                    },
                    child: trending![index]['title'] != null
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
                                              trending![index]['poster_path']),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ModifiedText(
                                  text: trending![index]['title'] ?? 'Loading',
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
