import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import '../description.dart';

class TV extends StatelessWidget {
  final List? tvresults;

  TV({this.tvresults});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Popular TV Shows',
            size: 26,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: tvresults!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                  name: tvresults![index]['name'],
                                  bannerUrl:
                                      'https://image.tmdb.org/t/p/w500/' +
                                          tvresults![index]['backdrop_path'],
                                  posterUrl:
                                      'https://image.tmdb.org/t/p/w500/' +
                                          tvresults![index]['poster_path'],
                                  description: tvresults![index]['overview'],
                                  vote: tvresults![index]['vote_average'],
                                  launchOn: tvresults![index]['first_air_date'],
                                )),
                      );
                    },
                    child: tvresults![index]['name'] != null
                        ? SizedBox(
                            width: 250,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  width: 250,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500/' +
                                                tvresults![index]
                                                    ['backdrop_path']),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ModifiedText(
                                  text: tvresults![index]['name'] ?? 'Loading',
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
