class PartDto {
  int? order;
  String? description;
  DateTime? deadLine;
  int? price;

  PartDto({this.order, this.description, this.deadLine, this.price});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['order'] = order;
    data['description'] = description;
    data['deadLine'] = deadLine?.toIso8601String();
    data['price'] = price;
    return data;
  }
}

class AddContractParam {
  String? serviceId;
  String? freeLancerId;
  String? description;
  DateTime? deadLine;
  DateTime? deadLineSupport;
  int? totalPrice;
  List<PartDto?>? partDtos;

  AddContractParam(
      {this.serviceId,
      this.freeLancerId,
      this.description,
      this.deadLine,
      this.deadLineSupport,
      this.totalPrice,
      this.partDtos});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['serviceId'] = serviceId;
    data['freeLancerId'] = freeLancerId;
    data['description'] = description;
    data['deadLine'] = deadLine?.toIso8601String();
    data['deadLineSupport'] = deadLineSupport?.toIso8601String();
    data['totalPrice'] = totalPrice;
    data['partDtos'] =
        partDtos != null ? partDtos!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}
