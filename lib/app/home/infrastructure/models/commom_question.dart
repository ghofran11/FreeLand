class CommonQuestionModel {
  String? id;
  String? question;
  String? answer;

  CommonQuestionModel({this.id, this.question, this.answer});

  CommonQuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answer'] = this.answer;
    return data;
  }
}

List<CommonQuestionModel> commonQuestionsFromJson(List<dynamic> data) {
  return data.map((e) => CommonQuestionModel.fromJson(e)).toList();
}
