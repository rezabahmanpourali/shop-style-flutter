import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/services/response_model.dart';
import 'package:shop_style/home/data/repository/home_repository.dart';
import 'package:shop_style/home/models/barber_hair_model.dart';

class HomeController extends ChangeNotifier {
  HomeRepository homeRepository = HomeRepository();

  BlocStatus hairStatus = BlocStatusInitial();
  List<HairModel> hairs = [];
  String errorMessage = '';

  void fetchHair() async {
    hairStatus = BlocStatusLoading();
    notifyListeners();

    ResponseModel response = await homeRepository.getHairModel();

    if (response.hasError) {
      errorMessage = response.messageFactory;
      hairStatus = BlocStatusError(errorMessage, response.statusCode);
      notifyListeners();
    } else {
      hairs =
          (response.json as List).map((e) => HairModel.fromJson(e)).toList();
      hairStatus = BlocStatusCompleted(hairs);
      notifyListeners();
    }
  }
}
