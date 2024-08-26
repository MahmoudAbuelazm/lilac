import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lilac/data/models/contact_us_model.dart';

import '../../../utils/constants.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());
  ContactUsModel? contactUsModel;
  Dio dio = Dio();
  Future<void> getAboutUs() async {
    final response = await dio.get(url + contactUs);

    contactUsModel = ContactUsModel.fromJson(response.data);
    emit(ContactUsLoaded(contactUsModel!));
  }
}
