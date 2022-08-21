// To parse this JSON data, do
//
//     final serviceDto = serviceDtoFromMap(jsonString);

List<ServiceDto> serviceFromJson(List<dynamic> data) {
  return data.map((e) => ServiceDto.fromMap(e)).toList();
}

// class ServiceDto {
//   ServiceDto({
//     required this.id,
//     required this.name,
//     required this.ownerId,
//     required this.nameOwner,
//     required this.description,
//     required this.evalution,
//     required this.serviceType,
//     required this.minPrice,
//     required this.maxPrice,
//   });
//
//   final String id;
//   final String name;
//   final String ownerId;
//   final String nameOwner;
//   final String description;
//   final int? evalution;
//   final int serviceType;
//   final int minPrice;
//   final int maxPrice;
//
//   ServiceDto copyWith({
//     required String id,
//     required String name,
//     required String ownerId,
//     required String nameOwner,
//     required String description,
//     required int evalution,
//     required int serviceType,
//     required int minPrice,
//     required int maxPrice,
//   }) =>
//       ServiceDto(
//         id: id,
//         name: name,
//         ownerId: ownerId,
//         nameOwner: nameOwner,
//         description: description,
//         evalution: evalution,
//         serviceType: serviceType,
//         minPrice: minPrice,
//         maxPrice: maxPrice,
//       );
//
//   factory ServiceDto.fromJson(String str) => ServiceDto.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory ServiceDto.fromMap(Map<String, dynamic> json) => ServiceDto(
//     id: json["id"],
//     name: json["name"],
//     ownerId: json["ownerId"],
//     nameOwner: json["nameOwner"],
//     description: json["description"],
//     evalution: json["evalution"],
//     serviceType: json["serviceType"],
//     minPrice: json["minPrice"],
//     maxPrice: json["maxPrice"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "name": name,
//     "ownerId": ownerId,
//     "nameOwner": nameOwner,
//     "description": description,
//     "evalution": evalution,
//     "serviceType": serviceType,
//     "minPrice": minPrice,
//     "maxPrice": maxPrice,
//   };
// }
//
// /*
// Example Usage
// Map<String, dynamic> map = jsonDecode(<myJSONString>);
// var myRootNode = Root.fromJson(map);
// */
class DocumentDto {
  String? id;
  String? name;
  String? path;
  int? type;

  DocumentDto({this.id, this.name, this.path, this.type});

  DocumentDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    path = json['path'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['path'] = path;
    data['type'] = type;
    return data;
  }
}

class ServiceDto {
  late String id;
  late String name;
  late DateTime? deadLine;
  late String ownerId;
  late String nameOwner;
  String? freeLancerId;
  String? nameFreeLancer;
  late String description;
  int? evalution;
  int? serviceType;
  int? minPrice;
  int? maxPrice;
  int? numOfOffer;
  int? averageOfPrice;
  List<DocumentDto?>? documentDto;
  int? currentPart;
  num? completionRate;

  ServiceDto(
      {required this.id,
      required this.name,
      required this.deadLine,
      required this.ownerId,
      required this.nameOwner,
      this.freeLancerId,
      this.nameFreeLancer,
      required this.description,
      required this.evalution,
      this.serviceType,
      this.minPrice,
      this.completionRate,
      this.currentPart,
      this.maxPrice,
      this.numOfOffer,
      this.averageOfPrice,
      this.documentDto});

  ServiceDto.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    deadLine =
        json['deadLine'] != null ? DateTime.tryParse(json['deadLine']) : null;
    ownerId = json['ownerId'];
    nameOwner = json['nameOwner'];
    freeLancerId = json['freeLancerId'];
    nameFreeLancer = json['nameFreeLancer'];
    description = json['description'];
    evalution = json['evalution'];
    serviceType = json['serviceType'];
    minPrice = json['minPrice'];
    maxPrice = json['maxPrice'];
    numOfOffer = json['numOfOffer'];
    averageOfPrice = json['averageOfPrice'];
    completionRate = json['completionRate'];
    currentPart = json['currentPart'];
    if (json['documentDto'] != null) {
      documentDto = <DocumentDto>[];
      json['documentDto'].forEach((v) {
        documentDto!.add(DocumentDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['deadLine'] = deadLine;
    data['ownerId'] = ownerId;
    data['nameOwner'] = nameOwner;
    data['freeLancerId'] = freeLancerId;
    data['nameFreeLancer'] = nameFreeLancer;
    data['description'] = description;
    data['evalution'] = evalution;
    data['serviceType'] = serviceType;
    data['minPrice'] = minPrice;
    data['maxPrice'] = maxPrice;
    data['numOfOffer'] = numOfOffer;
    data['averageOfPrice'] = averageOfPrice;
    data['documentDto'] = documentDto != null
        ? documentDto!.map((v) => v?.toJson()).toList()
        : null;
    return data;
  }
}
