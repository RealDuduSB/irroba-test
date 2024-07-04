class Category {
  final int categoryId;
  final String name;
  final String image;
  final String metaTitle;
  final String metaDescription;
  final String description;
  final String dateAdded;
  final String status;
  final int sortOrder;

  Category({
    required this.categoryId,
    required this.name,
    required this.image,
    required this.metaTitle,
    required this.metaDescription,
    required this.description,
    required this.dateAdded,
    required this.status,
    required this.sortOrder,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id'],
      name: json['category_description'][0]['name'],
      image: json['image'] ?? '',
      metaTitle: json['category_description'][0]['meta_title'] ?? '',
      metaDescription:
          json['category_description'][0]['meta_description'] ?? '',
      description: json['category_description'][0]['description'] ?? '',
      dateAdded: json['date_added'],
      status: json['status'].toString(),
      sortOrder: json['sort_order'],
    );
  }
}
