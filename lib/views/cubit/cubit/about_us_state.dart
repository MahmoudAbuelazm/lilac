part of 'about_us_cubit.dart';

sealed class AboutUsState {}

final class AboutUsInitial extends AboutUsState {}

final class AboutUsLoading extends AboutUsState {}

final class AboutUsLoaded extends AboutUsState {
  AboutUsModel aboutUsModel;
  AboutUsLoaded(
    this.aboutUsModel,
  );
}
