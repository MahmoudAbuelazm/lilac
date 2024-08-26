part of 'contact_us_cubit.dart';

sealed class ContactUsState {}

final class ContactUsInitial extends ContactUsState {}

final class ContactUsLoading extends ContactUsState {}

final class ContactUsLoaded extends ContactUsState {
  ContactUsModel contactUsModel;
  ContactUsLoaded(
    this.contactUsModel,
  );
}
