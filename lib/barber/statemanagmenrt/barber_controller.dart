import 'package:flutter/material.dart';
import 'package:shop_style/barber/data/repository/barber_repository.dart';
import 'package:shop_style/barber/model/barber_model.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/services/response_model.dart';

class BarberController extends ChangeNotifier {
  BarberRepository barberRepository = BarberRepository();

  BlocStatus barberStatus = BlocStatusInitial();
  List<BarberModel> barber = [];
  String errorMessage = '';

  void fetchBarber(int? barberShopId) async {
    barberStatus = BlocStatusLoading();
    notifyListeners();

    ResponseModel response = await barberRepository.getBarber(barberShopId);

    if (response.hasError) {
      errorMessage = response.messageFactory;
      barberStatus = BlocStatusError(errorMessage, response.statusCode);
      notifyListeners();
    } else {
      barber =
          (response.json as List).map((e) => BarberModel.fromJson(e)).toList();
      barberStatus = BlocStatusCompleted(barber);
      notifyListeners();
    }
  }
}
