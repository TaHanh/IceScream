class Question {
  String question;
  List<Answer> answer;

  Question({this.question, this.answer});

  Question.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    if (json['answer'] != null) {
      answer = new List<Answer>();
      json['answer'].forEach((v) {
        answer.add(new Answer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    if (this.answer != null) {
      data['answer'] = this.answer.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answer {
  String user;
  String value;

  Answer({this.user, this.value});

  Answer.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['value'] = this.value;
    return data;
  }
}
