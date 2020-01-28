import 'package:flutter/material.dart';
import 'package:podcasts/models/search/search_result_item.dart';
import 'package:podcasts/models/search/search_results.dart';
import 'package:podcasts/services/search_service.dart';
import 'package:podcasts/screens/podcast_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Podcasts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            headline: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            caption: TextStyle(fontSize: 14.0, color: Colors.white)),
      ),
      home: MyHomePage(title: 'Podcast Search'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<SearchResults> searchResults;

  Widget _buildPodcastList(List<SearchResultItem> results) {
    return ListView(
      children: _buildPodcastItemList(results),
    );
  }

  List<Widget> _buildPodcastItemList(List<SearchResultItem> results) {
    return results
        .map<Widget>(
          (result) => ListTile(
            leading: Image.network(result.artworkUrl100),
            title: Text(result.collectionName),
            subtitle: Text(result.artistName),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PodcastDetail(podcast: result)),
              );
            },
          ),
        )
        .toList();
  }

  // TODO: Extract this functionality into a new widget page. The main should just show the app scaffold and bottom navigation....
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                searchResults = SearchService.searchPodcast('joe rogan');
              });
            },
            icon: Icon(Icons.search),
            tooltip: "Search",
          ),
        ],
      ),
      body: (FutureBuilder<SearchResults>(
        future: searchResults,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.resultCount > 0) {
              return _buildPodcastList(snapshot.data.results);
            }
            return Text("No search results :(");
          } else if (snapshot.hasError) {
            return Text("Error loading podcasts...");
          }

          return Center(
              child: Text(
            "Search Podcasts",
            style: TextStyle(fontSize: 24.0),
          ));
        },
      )),
    );
  }
}
