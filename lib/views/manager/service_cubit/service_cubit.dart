import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lilac/data/models/service_model.dart';

import '../../../utils/constants.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitial());
  TextEditingController searchController = TextEditingController();

  ServiceModel? serviceModel;

  Dio dio = Dio();
  Future<void> getcontent() async {
    emit(ServiceLoading());
    final response = await dio.get(url + service);
    serviceModel = ServiceModel.fromJson(response.data);
    emit(ServiceLoaded(serviceModel!));
  }

  Future<void> getcontentById(String id) async {
    emit(ServiceLoading());
    final response = await dio.get("$url$service?slug=$id");
    serviceModel = ServiceModel.fromJson(response.data);
    emit(ServiceLoaded(serviceModel!));
  }
}
