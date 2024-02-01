import 'dart:developer';

import 'package:bloc_boiler_plate/config/flavour_config.dart';
import 'package:bloc_boiler_plate/utils/dio_client.dart';

class InitializationRepository {
  late DioClient dioClient;
  late FlavorConfig apiConfig;

  Future<void> init(FlavorConfig flavorConfig) async {
    dioClient = DioClient(flavorConfig: flavorConfig);
    log("::::::::::::::::::::: DioClient Initialized :::::::::::::::::::::");
  }
}
