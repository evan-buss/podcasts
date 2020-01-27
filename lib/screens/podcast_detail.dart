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
  RssService rssService = new RssService();
  RssFeed rssFeed;

  Widget _podcastWidget(RssFeed feed) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(24.0),
          child: new ClipRRect(
            borderRadius: new BorderRadius.circular(12.0),
            child: Image.network(
              feed.image.url,
            ),
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 24.0,
                spreadRadius: 0.4,
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(feed.title, style: Theme.of(context).textTheme.headline),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(feed.description,
              style: Theme.of(context).textTheme.caption),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Podcast Details"),
      ),
      body: FutureBuilder<RssFeed>(
        future: rssService.parseFeed(widget.podcast.feedUrl),
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
