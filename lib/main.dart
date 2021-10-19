import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tvresults.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.teal[800],
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tvResults = [];

  final String apikey = 'c2e759947fc558d1afd42981803d412e';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMmU3NTk5NDdmYzU1OGQxYWZkNDI5ODE4MDNkNDEyZSIsInN1YiI6IjYxNmQwZjg4OTcxNWFlMDA0NDdlYWJmNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.yOglihBYfHjt6lcBnLb4WM-1bO8vNarLBuZKdlx3PAk';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readAccessToken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map trendingResults = await tmdbWithCustomLogs.v3.trending.getTrending();

    Map topRatedResults = await tmdbWithCustomLogs.v3.movies.getTopRated();

    Map tvPopularResults = await tmdbWithCustomLogs.v3.tv.getPouplar();

    setState(() {
      trendingMovies = trendingResults['results'];

      topRatedMovies = topRatedResults['results'];

      tvResults = tvPopularResults['results'];
    });
    print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.teal[800],
        centerTitle: true,
        title: ModifiedText(text: 'TMDB Movie App'),
      ),
      body: ListView(
        children: [
          TopRated(
            topRated: topRatedMovies,
          ),
          TrendingMovies(
            trending: trendingMovies,
          ),
          TV(
            tvresults: tvResults,
          ),
        ],
      ),
    );
  }
}
