class BannerEntity {
  final String imgUrl;
  final String redirecUrl;
  BannerEntity({
    required this.imgUrl,
    required this.redirecUrl,
  });


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BannerEntity &&
        other.imgUrl == imgUrl &&
        other.redirecUrl == redirecUrl;
  }

  @override
  int get hashCode => imgUrl.hashCode ^ redirecUrl.hashCode;
}
