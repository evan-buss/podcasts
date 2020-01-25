import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:podcasts/model/search/search_results.dart';

class SearchService {
  static final String searchUrl = 'itunes.apple.com';

  static Future<String> searchPodcast(String searchTerm) async {
    var query = {
      'term': searchTerm,
      'entity': 'podcast',
    };

    var uri = Uri.https(searchUrl, '/search', query);
    var response = await http.get(uri, headers: query);
    if (response.statusCode == 200) {
      print(
          "Found ${SearchResults.fromJson(jsonDecode(response.body.trim())).resultCount} results");
    }
  }
}
