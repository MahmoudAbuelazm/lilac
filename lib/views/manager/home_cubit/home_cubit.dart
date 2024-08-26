import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/content_model.dart';
import '../../../utils/constants.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  ResponseModel? responseModel;
  Dio dio = Dio();
  Future<void> getcontent() async {
    final response = await dio.get(url + content);

    responseModel = ResponseModel.fromJson(response.data);
   
    emit(HomeLoaded(responseModel!));
  }
}
