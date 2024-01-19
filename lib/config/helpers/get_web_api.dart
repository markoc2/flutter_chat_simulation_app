import 'package:dio/dio.dart';
import 'package:flutter_yes_no_app/domain/entities/message.dart';
import 'package:flutter_yes_no_app/infrastructure/models/api_model.dart';

class GetWebApiAnswers {
  final _dio = Dio();

  Future<Message> getAnswers() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final apiModel = ApiModel.fromJsonMap(response.data);

    //return Message( text: apiModel.answer, fromWho: FromWho.hers, imageURL: apiModel.image);
    return apiModel.toMessageEntity();
  }
}
