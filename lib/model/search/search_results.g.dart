// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResults _$SearchResultsFromJson(Map<String, dynamic> json) {
  return SearchResults()
    ..resultCount = json['resultCount'] as int
    ..results = (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : SearchResultItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SearchResultsToJson(SearchResults instance) =>
    <String, dynamic>{
      'resultCount': instance.resultCount,
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
    };
