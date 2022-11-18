
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sample_base_framework/src/model/sample_model.dart';
import 'package:sample_base_framework/src/utils/navigations.dart';

import 'base_api_provider.dart';


class SampleProvider  extends BaseApiProvider{

  Future<SampleModelResponse> getTouristList() async {
    try {
      String url = BaseApiProvider.baseUrl + 'api/Tourist';
      print(url);
      Response uriResponse = await dio.get(
        url,
      );
      var jsonData = getResponseData(uriResponse);
      SampleModelResponse chatMessageCp = SampleModelResponse();
      chatMessageCp.hasError = false;
      chatMessageCp.sampleModel = SampleModel.fromJson(jsonData);

      return chatMessageCp;
    } on DioError catch (error) {
      print("Exception message: ${error.response?.data}");

      Navigation.navigateOnError(error);
      rethrow;
    } catch (error) {
      print("Exception message: ${error}");
      SampleModelResponse sampleModel = SampleModelResponse();
      sampleModel.hasError = true;
      sampleModel.errorMessage = error.toString();
      return sampleModel;
    }
  }

 Future<TouristModel> addTouristPlace(Map map) async {
    try {
           String url = BaseApiProvider.baseUrl + 'api/Tourist';
        Response uriResponse = await dio.post(url,
          data: json.encode(map)
          );
      var jsonData = getResponseData(uriResponse);
      TouristModel chatMessageCp = TouristModel.fromJson(jsonData);


      return chatMessageCp;
    } catch (error) {
      print("error--->${error.toString()}");
     throw error;
    }

  }


}