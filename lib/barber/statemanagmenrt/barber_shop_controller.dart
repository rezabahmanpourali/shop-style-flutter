import 'package:flutter/foundation.dart';
import 'package:shop_style/barber/data/repository/barber_shop_repository.dart';
import 'package:shop_style/barber/model/barber_shop_model.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/services/response_model.dart';

class BarberShopController extends ChangeNotifier {
  BarberShopRepository barberShopRepository = BarberShopRepository();

  BlocStatus barberShopState = BlocStatusInitial();
  List<BarberShopModel> barberShops = [];
  String errorMessage = '';

  void fetchBarberShops() async {
    barberShopState = BlocStatusLoading();
    notifyListeners();

    ResponseModel response = await barberShopRepository.getBarberShops();

    if (response.hasError) {
      errorMessage = response.messageFactory;
      barberShopState = BlocStatusError(errorMessage, response.statusCode);
    } else {
      barberShops = (response.json as List)
          .map((e) => BarberShopModel.fromJsone(e))
          .toList();
      barberShopState = BlocStatusCompleted(null);
    }

    notifyListeners();
  }
}
