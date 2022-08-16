
class AddProjectParams {
  String projectName;
  DateTime projectDeadLine;
  String desc;
  int minPrice;
  int maxPrice;

  AddProjectParams(
      {required this.projectName,
      required this.projectDeadLine,
      required this.desc,
      required this.maxPrice,
      required this.minPrice});

  AddProjectParams copyWith({
    String? projectName,
    DateTime? projectDeadLine,
    String? desc,
    int? minPrice,
    int? maxPrice,
  }) {
    return AddProjectParams(
        projectName: projectName ?? this.projectName,
        projectDeadLine: projectDeadLine ?? this.projectDeadLine,
        desc: desc ?? this.desc,
        maxPrice: maxPrice ?? this.maxPrice,
        minPrice: minPrice ?? this.minPrice);
  }

  Future<Map<String,dynamic>> toJson()async{
    return{
      'serviceId':projectName,
      'text':desc,
      'price':projectDeadLine,
      'price':minPrice,
      'price':maxPrice,
    };
  }


}
