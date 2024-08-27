part of 'service_cubit.dart';

sealed class ServiceState {}

final class ServiceInitial extends ServiceState {}

final class ServiceLoaded extends ServiceState {
  final ServiceModel serviceModel;

  ServiceLoaded(this.serviceModel);
}
