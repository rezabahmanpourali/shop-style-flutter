import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/services/response_model.dart';
import 'package:shop_style/home/data/repository/category_repository.dart';
import 'package:shop_style/home/data/repository/home_repository.dart';
import 'package:shop_style/home/models/barber_hair_model.dart';
import 'package:shop_style/home/models/category_model.dart';

class HomeController extends ChangeNotifier {
  HomeRepository homeRepository = HomeRepository();
  CategoryRepository categoryRepository = CategoryRepository();

  BlocStatus hairStatus = BlocStatusInitial();
  BlocStatus categoryStatus = BlocStatusInitial();
  BlocStatus latLongStatus = BlocStatusInitial();
  List<HairModel> hairs = [];
  List<CategoryModel> categories = [];
  String errorMessage = '';
  ResponseModel? latLongResponse;

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

  //CategoryModel
  void fetchCategory() async {
    categoryStatus = BlocStatusLoading();
    notifyListeners();

    ResponseModel response = await categoryRepository.getCategoryModel();

    if (response.hasError) {
      errorMessage = response.messageFactory;
      categoryStatus = BlocStatusError(errorMessage, response.statusCode);
      notifyListeners();
    } else {
      categories = (response.json as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
      categoryStatus = BlocStatusCompleted(categories);
      notifyListeners();
    }
  }

  // متد ارسال مختصات طول و عرض جغرافیایی
  void sendLatLong({
    required String longitude,
    required String latitude,
    required int id,
    required int customerId,
  }) async {
    latLongStatus = BlocStatusLoading();
    notifyListeners();

    latLongResponse = await homeRepository.sendLatLong(
      longitude: longitude,
      latitude: latitude,
      id: id,
      customerId: customerId,
    );

    if (latLongResponse?.statusCode == 200) {
      latLongStatus = BlocStatusCompleted(latLongResponse);
    } else {
      latLongStatus = BlocStatusError(
        latLongResponse?.error?.message,
        latLongResponse!.statusCode,
      );
    }
  }
}
