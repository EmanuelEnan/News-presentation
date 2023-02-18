class News {
  News({
    required this.status,
    required this.totalResults,
    required this.articles,
  });
  late final String status;
  late final int totalResults;
  late final List<Articles> articles;

  News.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? 'no value';
    totalResults = json['totalResults'];
    articles =
        List.from(json['articles']).map((e) => Articles.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['totalResults'] = totalResults;
    _data['articles'] = articles.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Articles {
  Articles({
    required this.title,
    required this.description,
  });

  late final String title;
  late final String description;

  Articles.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? 'no value';
    description = json['description'] ?? 'no value';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['title'] = title;
    _data['description'] = description;

    return _data;
  }
}
