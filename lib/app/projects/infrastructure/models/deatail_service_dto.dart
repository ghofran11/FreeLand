import 'dart:convert';
List<DetailServiceDto> DetailServiceFromJson(List<dynamic> data) {
  return data.map((e) => DetailServiceDto.fromMap(e)).toList();
}
class DetailServiceDto {
  DetailServiceDto({
    this.id,
   required this.name,
    this.deadLine,
   required this.ownerId,
  required  this.nameOwner,
    this.freeLancerId,
    this.nameFreeLancer,
   required this.description,
    this.evalution,
    this.serviceType,
    this.minPrice,
    this.maxPrice,
    this.numOfOffer,
    this.averageOfPrice,
    this.currentPart,
    this.completionRate,
    // required this.documentDto,
    this.categoryDtos,
    this.contractDto,
    this.commentDtos,
    this.offerDtos,
  });

  final String? id;
  final String name;
  final DateTime? deadLine;
  final String ownerId;
  final String nameOwner;
  final String? freeLancerId;
  final String? nameFreeLancer;
  final String description;
  final int? evalution;
  final int? serviceType;
  final int? minPrice;
  final int? maxPrice;
  final int? numOfOffer;
  final int? averageOfPrice;
  final int? currentPart;
  final int? completionRate;
  //final List<DocumentDto> documentDto;
  final List<CategoryDto>? categoryDtos;
  final List<ContractDto>? contractDto;
  final List<CommentDto>? commentDtos;
  final List<OfferDto>? offerDtos;

  DetailServiceDto copyWith({
    String? id,
    String? name,
    DateTime? deadLine,
    String? ownerId,
    String? nameOwner,
    String? freeLancerId,
    String? nameFreeLancer,
    String? description,
    int? evalution,
    int? serviceType,
    int? minPrice,
    int? maxPrice,
    int? numOfOffer,
    int? averageOfPrice,
    int? currentPart,
    int? completionRate,
    List<DocumentDto>? documentDto,
    List<CategoryDto>? categoryDtos,
    List<ContractDto>? contractDto,
    List<CommentDto>? commentDtos,
    List<OfferDto>? offerDtos,
  }) =>
      DetailServiceDto(
        id: id ?? this.id,
        name: name ?? this.name,
        deadLine: deadLine ?? this.deadLine,
        ownerId: ownerId ?? this.ownerId,
        nameOwner: nameOwner ?? this.nameOwner,
        freeLancerId: freeLancerId ?? this.freeLancerId,
        nameFreeLancer: nameFreeLancer ?? this.nameFreeLancer,
        description: description ?? this.description,
        evalution: evalution ?? this.evalution,
        serviceType: serviceType ?? this.serviceType,
        minPrice: minPrice ?? this.minPrice,
        maxPrice: maxPrice ?? this.maxPrice,
        numOfOffer: numOfOffer ?? this.numOfOffer,
        averageOfPrice: averageOfPrice ?? this.averageOfPrice,
        currentPart: currentPart ?? this.currentPart,
        completionRate: completionRate ?? this.completionRate,
        // documentDto: documentDto ?? this.documentDto,
        categoryDtos: categoryDtos ?? this.categoryDtos,
        contractDto: contractDto ?? this.contractDto,
        commentDtos: commentDtos ?? this.commentDtos,
        offerDtos: offerDtos ?? this.offerDtos,
      );

  factory DetailServiceDto.fromJson(String str) => DetailServiceDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailServiceDto.fromMap(Map<String, dynamic> json) => DetailServiceDto(
    id: json["id"],
    name: json["name"],
    deadLine: DateTime.parse(json["deadLine"]),
    ownerId: json["ownerId"],
    nameOwner: json["nameOwner"],
    freeLancerId: json["freeLancerId"],
    nameFreeLancer: json["nameFreeLancer"],
    description: json["description"],
    evalution: json["evalution"],
    serviceType: json["serviceType"],
    minPrice: json["minPrice"],
    maxPrice: json["maxPrice"],
    numOfOffer: json["numOfOffer"],
    averageOfPrice: json["averageOfPrice"],
    currentPart: json["currentPart"],
    completionRate: json["completionRate"],
    //documentDto: List<DocumentDto>.from(json["documentDto"].map((x) => DocumentDto.fromMap(x))),
    categoryDtos: List<CategoryDto>.from(json["categoryDtos"].map((x) => CategoryDto.fromMap(x))),
    contractDto: List<ContractDto>.from(json["contractDto"].map((x) => ContractDto.fromMap(x))),
    commentDtos: List<CommentDto>.from(json["commentDtos"].map((x) => CommentDto.fromMap(x))),
    offerDtos: List<OfferDto>.from(json["offerDtos"].map((x) => OfferDto.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "deadLine": deadLine!.toIso8601String(),
    "ownerId": ownerId,
    "nameOwner": nameOwner,
    "freeLancerId": freeLancerId,
    "nameFreeLancer": nameFreeLancer,
    "description": description,
    "evalution": evalution,
    "serviceType": serviceType,
    "minPrice": minPrice,
    "maxPrice": maxPrice,
    "numOfOffer": numOfOffer,
    "averageOfPrice": averageOfPrice,
    "currentPart": currentPart,
    "completionRate": completionRate,
    //"documentDto": List<dynamic>.from(documentDto.map((x) => x.toMap())),
    "categoryDtos": List<dynamic>.from(categoryDtos!.map((x) => x.toMap())),
    "contractDto": List<dynamic>.from(contractDto!.map((x) => x.toMap())),
    "commentDtos": List<dynamic>.from(commentDtos!.map((x) => x.toMap())),
    "offerDtos": List<dynamic>.from(offerDtos!.map((x) => x.toMap())),
  };
}

class DocumentDto {
}

class CategoryDto {
  CategoryDto({
    required this.id,
    required this.name,
    required this.mainCategoryId,
  });

  final String id;
  final String name;
  final String mainCategoryId;

  CategoryDto copyWith({
    String? id,
    String? name,
    String? mainCategoryId,
  }) =>
      CategoryDto(
        id: id ?? this.id,
        name: name ?? this.name,
        mainCategoryId: mainCategoryId ?? this.mainCategoryId,
      );

  factory CategoryDto.fromJson(String str) => CategoryDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryDto.fromMap(Map<String, dynamic> json) => CategoryDto(
    id: json["id"],
    name: json["name"],
    mainCategoryId: json["mainCategoryId"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "mainCategoryId": mainCategoryId,
  };
}

class CommentDto {
  CommentDto({
    required this.id,
    required this.parentCommentId,
    required this.text,
    required this.senderId,
    required this.senderName,
    required this.serviceId,
    required this.sericeName,
    required this.offerId,
    required this.offerName,
  });

  final String id;
  final String parentCommentId;
  final String text;
  final String senderId;
  final String senderName;
  final String serviceId;
  final String sericeName;
  final String offerId;
  final String offerName;

  CommentDto copyWith({
    String? id,
    String? parentCommentId,
    String? text,
    String? senderId,
    String? senderName,
    String? serviceId,
    String? sericeName,
    String? offerId,
    String? offerName,
  }) =>
      CommentDto(
        id: id ?? this.id,
        parentCommentId: parentCommentId ?? this.parentCommentId,
        text: text ?? this.text,
        senderId: senderId ?? this.senderId,
        senderName: senderName ?? this.senderName,
        serviceId: serviceId ?? this.serviceId,
        sericeName: sericeName ?? this.sericeName,
        offerId: offerId ?? this.offerId,
        offerName: offerName ?? this.offerName,
      );

  factory CommentDto.fromJson(String str) => CommentDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentDto.fromMap(Map<String, dynamic> json) => CommentDto(
    id: json["id"],
    parentCommentId: json["parentCommentId"],
    text: json["text"],
    senderId: json["senderId"],
    senderName: json["senderName"],
    serviceId: json["serviceId"],
    sericeName: json["sericeName"],
    offerId: json["offerId"],
    offerName: json["offerName"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "parentCommentId": parentCommentId,
    "text": text,
    "senderId": senderId,
    "senderName": senderName,
    "serviceId": serviceId,
    "sericeName": sericeName,
    "offerId": offerId,
    "offerName": offerName,
  };
}

class ContractDto {
  ContractDto({
    required this.id,
    required this.description,
    required this.deadLine,
    required this.deadLineSupport,
    required this.totalPrice,
    required this.contractStatus,
    required this.partDtos,
  });

  final String id;
  final String description;
  final DateTime deadLine;
  final DateTime deadLineSupport;
  final int totalPrice;
  final int contractStatus;
  final List<PartDto> partDtos;

  ContractDto copyWith({
    String? id,
    String? description,
    DateTime? deadLine,
    DateTime? deadLineSupport,
    int? totalPrice,
    int? contractStatus,
    List<PartDto>? partDtos,
  }) =>
      ContractDto(
        id: id ?? this.id,
        description: description ?? this.description,
        deadLine: deadLine ?? this.deadLine,
        deadLineSupport: deadLineSupport ?? this.deadLineSupport,
        totalPrice: totalPrice ?? this.totalPrice,
        contractStatus: contractStatus ?? this.contractStatus,
        partDtos: partDtos ?? this.partDtos,
      );

  factory ContractDto.fromJson(String str) => ContractDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContractDto.fromMap(Map<String, dynamic> json) => ContractDto(
    id: json["id"],
    description: json["description"],
    deadLine: DateTime.parse(json["deadLine"]),
    deadLineSupport: DateTime.parse(json["deadLineSupport"]),
    totalPrice: json["totalPrice"],
    contractStatus: json["contractStatus"],
    partDtos: List<PartDto>.from(json["partDtos"].map((x) => PartDto.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "description": description,
    "deadLine": deadLine.toIso8601String(),
    "deadLineSupport": deadLineSupport.toIso8601String(),
    "totalPrice": totalPrice,
    "contractStatus": contractStatus,
    "partDtos": List<dynamic>.from(partDtos.map((x) => x.toMap())),
  };
}

class PartDto {
  PartDto({
    required this.id, required this.description,
    required this.startDate,
    required this.deadLine,
    required this.price,
  });

  final String id;
  final String description;
  final DateTime startDate;
  final DateTime deadLine;
  final int price;

  PartDto copyWith({
    String? id,
    String? description,
    DateTime? startDate,
    DateTime? deadLine,
    int? price,
  }) =>
      PartDto(
        id: id ?? this.id,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        deadLine: deadLine ?? this.deadLine,
        price: price ?? this.price,
      );

  factory PartDto.fromJson(String str) => PartDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PartDto.fromMap(Map<String, dynamic> json) => PartDto(
    id: json["id"],
    description: json["description"],
    startDate: DateTime.parse(json["startDate"]),
    deadLine: DateTime.parse(json["deadLine"]),
    price: json["price"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "description": description,
    "startDate": startDate.toIso8601String(),
    "deadLine": deadLine.toIso8601String(),
    "price": price,
  };
}

// class DocumentDto {
//   DocumentDto({
//     required this.id,
//     required this.name,
//     required this.path,
//     required this.type,
//   });
//
//   final String id;
//   final String name;
//   final String path;
//   final int type;
//
//   DocumentDto copyWith({
//     String? id,
//     String? name,
//     String? path,
//     int? type,
//   }) =>
//       DocumentDto(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         path: path ?? this.path,
//         type: type ?? this.type,
//       );
//
//   factory DocumentDto.fromJson(String str) => DocumentDto.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory DocumentDto.fromMap(Map<String, dynamic> json) => DocumentDto(
//     id: json["id"],
//     name: json["name"],
//     path: json["path"],
//     type: json["type"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "name": name,
//     "path": path,
//     "type": type,
//   };
// }

class OfferDto {
  OfferDto({
    required this.id,
    required this.serviceId,
    required this.serviceName,
    required this.text,
    required this.price,
  });

  final String id;
  final String serviceId;
  final String serviceName;
  final String text;
  final int price;

  OfferDto copyWith({
    String? id,
    String? serviceId,
    String? serviceName,
    String? text,
    int? price,
  }) =>
      OfferDto(
        id: id ?? this.id,
        serviceId: serviceId ?? this.serviceId,
        serviceName: serviceName ?? this.serviceName,
        text: text ?? this.text,
        price: price ?? this.price,
      );

  factory OfferDto.fromJson(String str) => OfferDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OfferDto.fromMap(Map<String, dynamic> json) => OfferDto(
    id: json["id"],
    serviceId: json["serviceId"],
    serviceName: json["serviceName"],
    text: json["text"],
    price: json["price"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "serviceId": serviceId,
    "serviceName": serviceName,
    "text": text,
    "price": price,
  };
}

