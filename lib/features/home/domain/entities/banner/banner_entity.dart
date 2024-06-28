class BannerEntity {
  final int id;
  final String url;
  final BannerType type;

  BannerEntity({
    required this.id,
    required this.url,
    required this.type,
  });
}

enum BannerType {
  link,
  shop,
}
