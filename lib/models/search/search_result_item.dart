import 'package:json_annotation/json_annotation.dart';

part 'search_result_item.g.dart';

@JsonSerializable()
class SearchResultItem {
  String wrapperType;
  String kind;
  int collectionId;
  int trackId;
  String artistName;
  String collectionName;
  String trackName;
  String collectionSensoredName;
  String trackCensoredName;
  String collectionViewUrl;
  String feedUrl;
  String trackViewUrl;
  String artworkUrl30;
  String artworkUrl60;
  String artworkUrl100;
  double collectionPrice;
  double trackPrice;
  double trackRenalPrice;
  double trackHdPrice;
  double trackHdRentalPrice;
  String releaseDate;
  String collectionExplicitness;
  String trackExplicitness;
  int trackCount;
  String country;
  String currency;
  String primaryGenreName;
  String contentAdvisoryRating;
  String artworkUrl600;
  List<String> genereIds;
  List<String> genres;

  SearchResultItem();

  factory SearchResultItem.fromJson(Map<String, dynamic> json) =>
      _$SearchResultItemFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultItemToJson(this);
}
