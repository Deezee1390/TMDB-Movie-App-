import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatelessWidget {
  final String? name, description, bannerUrl, posterUrl, launchOn;
  final num? vote;

  Description(
      {this.name,
      this.description,
      this.bannerUrl,
      this.posterUrl,
      this.vote,
      this.launchOn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerUrl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: ModifiedText(
                      text: ' 🌟 Average Rating - ' + vote.toString(),
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsetsDirectional.all(10),
              child: ModifiedText(
                text: name ?? 'Not Loaded',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: ModifiedText(
                text: 'Releasing on - ' + launchOn!,
                size: 14,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterUrl!),
                ),
                Flexible(
                  child: Container(
                    child: ModifiedText(
                      text: description,
                      size: 18,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
