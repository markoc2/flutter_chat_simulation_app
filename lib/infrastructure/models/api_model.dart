import 'package:flutter_yes_no_app/domain/entities/message.dart';

class ApiModel {
  String answer;
  bool forced;
  String image;

  ApiModel({required this.answer, required this.forced, required this.image});

  factory ApiModel.fromJsonMap(Map<String, dynamic> json) => ApiModel(
      answer: json['answer'], forced: json['forced'], image: json['image'].toString());


       Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };

    Message toMessageEntity()=>Message(text: answer =='yes' ? 'si': answer =='no' ? 'no': 'Talvez'  , fromWho: FromWho.hers,imageURL: image);
}
