import 'package:flutter/foundation.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;

class RssService {
  static Future<RssFeed> ParseFeed(String feedUrl) async {
    var response = await http.get(feedUrl);
    return compute(_parseXML, response.body);
  }

  static Future<RssFeed> _parseXML(String feed) async {
    return new RssFeed.parse(feed);
  }
}
