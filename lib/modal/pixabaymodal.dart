class Pixabay {
  double? total, totalHits;
  List<Hits> hits;
  Pixabay({required this.total,required this.hits,required this.totalHits});

  factory Pixabay.fromJson(Map m1)
  {
      return Pixabay(total: m1['total'], hits: (m1['hits'] as List).map((e) => Hits.fromJson(e),).toList(), totalHits: m1['totalHits']);
  }

}

class Hits {
  int? id,
      previeWidth,
      previewHeight,
      webformatWidth,
      webformatHeight,
      imageWidth,
      imageHeight,
      imageSize,
      views,
      downloads,
      collections,
      likes,
      comments,
      user_id;
  String? pageUrl,
      type,
      tags,
      previewURL,
      webformateURL,
      largeImageURL,
      user,
      userImageURL;

  Hits(
      {required this.id,
      required this.collections,
      required this.comments,
      required this.downloads,
      required this.imageHeight,
      required this.imageSize,
      required this.imageWidth,
      required this.largeImageURL,
      required this.likes,
      required this.pageUrl,
      required this.previewHeight,
      required this.previeWidth,
      required this.previewURL,
      required this.tags,
      required this.type,
      required this.user,
      required this.user_id,
      required this.userImageURL,
      required this.views,
      required this.webformateURL,
      required this.webformatHeight,
      required this.webformatWidth});

  factory Hits.fromJson(Map m1) {
    return Hits(
        id: m1['id'],
        collections: m1['collections'],
        comments: m1['comments'],
        downloads: m1['downloads'],
        imageHeight: m1['imageHeight'],
        imageSize: m1['imageSize'],
        imageWidth: m1['imageWidth'],
        largeImageURL: m1['largeImageURL'],
        likes: m1['likes'],
        pageUrl: m1['pageURL'],
        previewHeight: m1['previewHeight'],
        previeWidth: m1['previewWidth'],
        previewURL: m1['previewURL'],
        tags: m1['tags'],
        type: m1['type'],
        user: m1['user'],
        user_id: m1['user_id'],
        userImageURL: m1['userImageURL'],
        views: m1['views'],
        webformateURL: m1['webformatURL'],
        webformatHeight: m1['webformatHeight'],
        webformatWidth: m1['webformatWidth']);
  }
}
