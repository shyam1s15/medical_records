class PageModel {
  final PageInfoModel? page;

  PageModel({required this.page});

  factory PageModel.fromJson(Map<String, dynamic> json) {
    return PageModel(
      page: PageInfoModel.fromJson(json['page'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page?.toJson(),
    };
  }
}

class PageInfoModel {
  final int pageId;

  PageInfoModel({required this.pageId});

  factory PageInfoModel.fromJson(Map<String, dynamic> json) {
    return PageInfoModel(
      pageId: json['page_id'] ?? 0, // Default value if page_id is null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page_id': pageId,
    };
  }
}
