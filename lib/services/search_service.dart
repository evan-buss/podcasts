import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:podcasts/models/search/search_results.dart';

class SearchService {
  static final String searchUrl = 'itunes.apple.com';

  static Future<SearchResults> searchPodcast(String searchTerm) async {
    var query = {
      'term': searchTerm,
      'entity': 'podcast',
    };

    var uri = Uri.https(searchUrl, '/search', query);
    var response = await http.get(uri, headers: query);
    if (response.bodyBytes.length > 0) {
      return SearchResults.fromJson(jsonDecode(response.body.trim()));
    }
    // throw error if we didn't receive any response
    throw ("No response error");
  }
}
