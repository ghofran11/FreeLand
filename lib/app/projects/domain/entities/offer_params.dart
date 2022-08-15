class OfferParams {
  String serviceId;
  String text;
  int price;

  OfferParams({required this.serviceId,required this.text,required this.price});
  OfferParams coptWith({
  String? serviceId,
    String? text,
    int? price
  }) {
    return OfferParams(
        serviceId: serviceId?? this.serviceId,
        text: text?? this.text,
        price: price??this.price);
  }
  Future<Map<String,dynamic>> toJson()async{
    return{
      'serviceId':serviceId,
      'text':text,
      'price':price
    };
  }


}