import 'package:flip_card/flip_card.dart';
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
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 450.0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              feed.title,
              style: TextStyle(
                color: Colors.orange,
                fontSize: 16.0,
              ),
            ),
            stretchModes: [StretchMode.fadeTitle],
            collapseMode: CollapseMode.pin,
            background: FlipCard(
              front: Card(
                //TODO: Lower image gradient to make title visible
                child: Image.network(
                  feed.image.url,
                  fit: BoxFit.cover,
                ),
                margin: EdgeInsets.all(12.0),
                elevation: 4.0,
              ),
              back: Card(
                  color: Colors.lightBlue,
                  margin: EdgeInsets.all(12.0),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(feed.description,
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .apply(color: Colors.white)),
                  ),
                  elevation: 4.0),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(feed.items.map((item) {
            print(feed.items.length);
            return ListTile(
                title: Text(item.title ?? 'test'),
                subtitle: Text(item.author ?? 'subtitle'));
          }).toList()),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
