import 'package:flutter/foundation.dart';
import 'package:shop_style/barber/data/repository/barber_shop_repository.dart';
import 'package:shop_style/barber/data/repository/comment_repository.dart';
import 'package:shop_style/barber/data/repository/services_repository.dart';
import 'package:shop_style/barber/model/barber_shop_model.dart';
import 'package:shop_style/barber/model/comment_model.dart';
import 'package:shop_style/barber/model/services_model.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/services/response_model.dart';

class BarberShopController extends ChangeNotifier {
  //وابستگی ها به ریپازیتوری
  BarberShopRepository barberShopRepository = BarberShopRepository();
  CommentRepository commentRepository = CommentRepository();
  ServicesRepository servicesRepository = ServicesRepository();

  //
  BlocStatus barberShopState = BlocStatusInitial();
  BlocStatus topBarberShopState = BlocStatusInitial();
  BlocStatus commentStatus = BlocStatusInitial();
  BlocStatus servicState = BlocStatusInitial();
  List<BarberShopModel> barberShops = [];
  List<BarberShopModel> topBarberShops = [];
  List<CommentModel> comments = [];
  List<ServiceModel> services = [];
  String errorMessage = '';

  //کنترلر آرایشگاه ها
  void fetchBarberShops() async {
    barberShopState = BlocStatusLoading();
    notifyListeners();

    ResponseModel response =
        await barberShopRepository.getBarberShops(shopType: 'SEEN_RECENTLY');

    if (response.hasError) {
      errorMessage = response.messageFactory;
      barberShopState = BlocStatusError(errorMessage, response.statusCode);
    } else {
      barberShops = (response.json as List)
          .map((e) => BarberShopModel.fromJson(e))
          .toList();
      barberShopState = BlocStatusCompleted(null);
    }

    notifyListeners();
  }

  //کنترلر آرایشگاه منطقه شما
  void fetchTopBarberShops() async {
    topBarberShopState = BlocStatusLoading();
    notifyListeners();

    ResponseModel response =
        await barberShopRepository.getBarberShops(shopType: 'TOP_BARBERS');

    if (response.hasError) {
      errorMessage = response.messageFactory;
      topBarberShopState = BlocStatusError(errorMessage, response.statusCode);
    } else {
      topBarberShops = (response.json as List)
          .map((e) => BarberShopModel.fromJson(e))
          .toList();
      topBarberShopState = BlocStatusCompleted(null);
    }

    notifyListeners();
  }

  //کنترلر کامنت ها
  void fetchCommets(int? barberShopId) async {
    commentStatus = BlocStatusLoading();
    notifyListeners();

    ResponseModel response = await commentRepository.getComments(barberShopId!);

    if (response.hasError) {
      errorMessage = response.messageFactory;
      commentStatus = BlocStatusError(errorMessage, response.statusCode);
    } else {
      comments =
          (response.json as List).map((e) => CommentModel.fromJson(e)).toList();
      commentStatus = BlocStatusCompleted(comments);
    }
    notifyListeners();
  }

  //کنترلر خدمات
  void fetchServic(int? barberShopId) async {
    servicState = BlocStatusLoading();
    notifyListeners();

    ResponseModel response =
        await servicesRepository.getServices(barberShopId!);
    if (response.hasError) {
      errorMessage = response.messageFactory;
      servicState = BlocStatusError(errorMessage, response.statusCode);
    } else {
      services =
          (response.json as List).map((e) => ServiceModel.fromJson(e)).toList();
      servicState = BlocStatusCompleted(services);
    }
    notifyListeners();
  }
}
