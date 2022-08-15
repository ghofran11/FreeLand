
class ServiceParam{

  final String nameOwner;
  final int minPrice;
  final int maxPrice;
  final String description;
  ServiceParam({
    required this.nameOwner,
    required this.minPrice,
    required this.maxPrice,
    required this.description
});
  Map<String, dynamic> toJson() {
    return {
      'nameOwner': nameOwner,
      'minPrice': minPrice,
      "maxPrice": maxPrice,
      "description": description,
    };
  }

}