class ShopEntity {
  final int id;
  final String image;
  final String name;
  final String desc;
  final bool isFavorite;
  final bool hasWallet;
  final String duration;
  final double rating;
  final String sale;
  
  ShopEntity({
    required this.id,
    required this.image,
    required this.name,
    required this.desc,
    required this.isFavorite,
    required this.hasWallet,
    required this.duration,
    required this.rating,
    required this.sale,
  });
}
