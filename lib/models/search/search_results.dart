import 'package:json_annotation/json_annotation.dart';
import 'package:podcasts/models/search/search_result_item.dart';

part 'search_results.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchResults {
  int resultCount;
  List<SearchResultItem> results;

  SearchResults();

  factory SearchResults.fromJson(Map<String, dynamic> json) =>
      _$SearchResultsFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultsToJson(this);
}
