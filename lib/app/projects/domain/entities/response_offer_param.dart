import 'dart:convert';

class ResponseOfferParam{


  final String userId;
  final bool isAgree;


  ResponseOfferParam({
    required this.userId,
    required this.isAgree
  });

  String toJson() => json.encode(toMap());

//toDo
  Map<String, dynamic> toMap() => {
    "userId": userId,
    "isAgree": isAgree,
  };
}
