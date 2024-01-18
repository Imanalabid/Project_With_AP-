import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ChannelInfo {
  final String kind;
  final String etag;
  final PageInfo pageInfo;
  final List<ChannelItem> items;

  ChannelInfo({
    required this.kind,
    required this.etag,
    required this.pageInfo,
    required this.items,
  });

  factory ChannelInfo.fromJson(Map<String, dynamic> json) {
    var itemsList = json['items'] as List;
    List<ChannelItem> channelItems = itemsList.map((item) => ChannelItem.fromJson(item)).toList();

    return ChannelInfo(
      kind: json['kind'] ?? '',
      etag: json['etag'] ?? '',
      pageInfo: PageInfo.fromJson(json['pageInfo'] ?? {}),
      items: channelItems,
    );
  }
}

class PageInfo {
  final int totalResults;
  final int resultsPerPage;

  PageInfo({
    required this.totalResults,
    required this.resultsPerPage,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) {
    return PageInfo(
      totalResults: json['totalResults'] ?? 0,
      resultsPerPage: json['resultsPerPage'] ?? 0,
    );
  }
}

class ChannelItem {
  final String kind;
  final String etag;
  final String id;
  final Snippet snippet;
  final ContentDetails contentDetails;
  final Statistics statistics;

  ChannelItem({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
    required this.contentDetails,
    required this.statistics,
  });

  factory ChannelItem.fromJson(Map<String, dynamic> json) {
    return ChannelItem(
      kind: json['kind'] ?? '',
      etag: json['etag'] ?? '',
      id: json['id'] ?? '',
      snippet: Snippet.fromJson(json['snippet'] ?? {}),
      contentDetails: ContentDetails.fromJson(json['contentDetails'] ?? {}),
      statistics: Statistics.fromJson(json['statistics'] ?? {}),
    );
  }
}

class Snippet {
  final String title;
  final String description;
  final String customUrl;
  final String publishedAt;
  final Thumbnails thumbnails;
  final Localized localized;
  final String country;

  Snippet({
    required this.title,
    required this.description,
    required this.customUrl,
    required this.publishedAt,
    required this.thumbnails,
    required this.localized,
    required this.country,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) {
    return Snippet(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      customUrl: json['customUrl'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      thumbnails: Thumbnails.fromJson(json['thumbnails'] ?? {}),
      localized: Localized.fromJson(json['localized'] ?? {}),
      country: json['country'] ?? '',
    );
  }
}

class Thumbnails {
  final ThumbnailItem defaultThumbnail;
  final ThumbnailItem medium;
  final ThumbnailItem high;

  Thumbnails({
    required this.defaultThumbnail,
    required this.medium,
    required this.high,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) {
    return Thumbnails(
      defaultThumbnail: ThumbnailItem.fromJson(json['default'] ?? {}),
      medium: ThumbnailItem.fromJson(json['medium'] ?? {}),
      high: ThumbnailItem.fromJson(json['high'] ?? {}),
    );
  }
}

class ThumbnailItem {
  final String url;
  final int width;
  final int height;

  ThumbnailItem({
    required this.url,
    required this.width,
    required this.height,
  });

  factory ThumbnailItem.fromJson(Map<String, dynamic> json) {
    return ThumbnailItem(
      url: json['url'] ?? '',
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
    );
  }
}

class Localized {
  final String title;
  final String description;

  Localized({
    required this.title,
    required this.description,
  });

  factory Localized.fromJson(Map<String, dynamic> json) {
    return Localized(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

class ContentDetails {
  final RelatedPlaylists relatedPlaylists;

  ContentDetails({
    required this.relatedPlaylists,
  });

  factory ContentDetails.fromJson(Map<String, dynamic> json) {
    return ContentDetails(
      relatedPlaylists: RelatedPlaylists.fromJson(json['relatedPlaylists'] ?? {}),
    );
  }
}

class RelatedPlaylists {
  final String likes;
  final String uploads;

  RelatedPlaylists({
    required this.likes,
    required this.uploads,
  });

  factory RelatedPlaylists.fromJson(Map<String, dynamic> json) {
    return RelatedPlaylists(
      likes: json['likes'] ?? '',
      uploads: json['uploads'] ?? '',
    );
  }
}

class Statistics {
  final String viewCount;
  final String subscriberCount;
  final bool hiddenSubscriberCount;
  final String videoCount;

  Statistics({
    required this.viewCount,
    required this.subscriberCount,
    required this.hiddenSubscriberCount,
    required this.videoCount,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      viewCount: json['viewCount'] ?? '',
      subscriberCount: json['subscriberCount'] ?? '',
      hiddenSubscriberCount: json['hiddenSubscriberCount'] ?? false,
      videoCount: json['videoCount'] ?? '',
    );
  }
}
