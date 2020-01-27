import 'package:flutter/material.dart';
import 'package:podcasts/models/search/search_result_item.dart';
import 'package:podcasts/models/search/search_results.dart';
import 'package:podcasts/services/search_service.dart';
import 'package:podcasts/screens/podcast_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Podcasts',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            headline: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            caption: TextStyle(fontSize: 14.0, color: Colors.grey)),
      ),
      home: MyHomePage(title: 'Podcast Search'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
