import 'package:flutter/material.dart';
import 'package:podcasts/models/search/search_result_item.dart';
import 'package:podcasts/services/rss_service.dart';
import 'package:webfeed/webfeed.dart';

class PodcastDetail extends StatefulWidget {
  final SearchResultItem podcast;

  PodcastDetail({Key key, @required this.podcast}) : super(key: key);

  @override
  _PodcastDetailState createState() => _PodcastDetailState();
}

class _PodcastDetailState extends State<PodcastDetail> {
  RssFeed rssFeed;

  Widget _podcastWidget(RssFeed feed) {
    return Column(
      children: <Widget>[Image.network(feed.image.url)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: FutureBuilder<RssFeed>(
        future: RssService.ParseFeed(widget.podcast.feedUrl),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _podcastWidget(snapshot.data);
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
