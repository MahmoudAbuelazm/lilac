import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lilac/data/models/about_us_model.dart';

import '../../../utils/constants.dart';

part 'about_us_state.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit() : super(AboutUsInitial());
  AboutUsModel? aboutUsModel;
  Dio dio = Dio();
  Future<void> getAboutUs() async {
    final response = await dio.get(url + aboutUs);

    aboutUsModel = AboutUsModel.fromJson(response.data);
    emit(AboutUsLoaded(aboutUsModel!));
  }
}
