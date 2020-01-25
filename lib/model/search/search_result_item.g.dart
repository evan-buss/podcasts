// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultItem _$SearchResultItemFromJson(Map<String, dynamic> json) {
  return SearchResultItem()
    ..wrapperType = json['wrapperType'] as String
    ..kind = json['kind'] as String
    ..collectionId = json['collectionId'] as int
    ..trackId = json['trackId'] as int
    ..artistName = json['artistName'] as String
    ..collectionName = json['collectionName'] as String
    ..trackName = json['trackName'] as String
    ..collectionSensoredName = json['collectionSensoredName'] as String
    ..trackCensoredName = json['trackCensoredName'] as String
    ..collectionViewUrl = json['collectionViewUrl'] as String
    ..feedUrl = json['feedUrl'] as String
    ..trackViewUrl = json['trackViewUrl'] as String
    ..artworkUrl30 = json['artworkUrl30'] as String
    ..artworkUrl60 = json['artworkUrl60'] as String
    ..artworkUrl100 = json['artworkUrl100'] as String
    ..collectionPrice = (json['collectionPrice'] as num)?.toDouble()
    ..trackPrice = (json['trackPrice'] as num)?.toDouble()
    ..trackRenalPrice = (json['trackRenalPrice'] as num)?.toDouble()
    ..trackHdPrice = (json['trackHdPrice'] as num)?.toDouble()
    ..trackHdRentalPrice = (json['trackHdRentalPrice'] as num)?.toDouble()
    ..releaseDate = json['releaseDate'] as String
    ..collectionExplicitness = json['collectionExplicitness'] as String
    ..trackExplicitness = json['trackExplicitness'] as String
    ..trackCount = json['trackCount'] as int
    ..country = json['country'] as String
    ..currency = json['currency'] as String
    ..primaryGenreName = json['primaryGenreName'] as String
    ..contentAdvisoryRating = json['contentAdvisoryRating'] as String
    ..artworkUrl600 = json['artworkUrl600'] as String
    ..genereIds = (json['genereIds'] as List)?.map((e) => e as String)?.toList()
    ..genres = (json['genres'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$SearchResultItemToJson(SearchResultItem instance) =>
    <String, dynamic>{
      'wrapperType': instance.wrapperType,
      'kind': instance.kind,
      'collectionId': instance.collectionId,
      'trackId': instance.trackId,
      'artistName': instance.artistName,
      'collectionName': instance.collectionName,
      'trackName': instance.trackName,
      'collectionSensoredName': instance.collectionSensoredName,
      'trackCensoredName': instance.trackCensoredName,
      'collectionViewUrl': instance.collectionViewUrl,
      'feedUrl': instance.feedUrl,
      'trackViewUrl': instance.trackViewUrl,
      'artworkUrl30': instance.artworkUrl30,
      'artworkUrl60': instance.artworkUrl60,
      'artworkUrl100': instance.artworkUrl100,
      'collectionPrice': instance.collectionPrice,
      'trackPrice': instance.trackPrice,
      'trackRenalPrice': instance.trackRenalPrice,
      'trackHdPrice': instance.trackHdPrice,
      'trackHdRentalPrice': instance.trackHdRentalPrice,
      'releaseDate': instance.releaseDate,
      'collectionExplicitness': instance.collectionExplicitness,
      'trackExplicitness': instance.trackExplicitness,
      'trackCount': instance.trackCount,
      'country': instance.country,
      'currency': instance.currency,
      'primaryGenreName': instance.primaryGenreName,
      'contentAdvisoryRating': instance.contentAdvisoryRating,
      'artworkUrl600': instance.artworkUrl600,
      'genereIds': instance.genereIds,
      'genres': instance.genres,
    };
