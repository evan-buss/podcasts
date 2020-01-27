import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;

Future<RssFeed> _parseXML(String feed) async {
  return new RssFeed.parse(feed);
}

class RssService {
  Future<RssFeed> parseFeed(String feedUrl) async {
    var response = await http.get(feedUrl);
    return await compute(_parseXML, response.body);
  }
}
