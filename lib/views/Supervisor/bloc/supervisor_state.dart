part of 'supervisor_bloc.dart';

@immutable
sealed class SupervisorState {}

final class SupervisorInitial extends SupervisorState {}

class SupervisorScanSuccess extends SupervisorState {
  final String qrString;
  SupervisorScanSuccess(this.qrString);
}

class SupervisorScanFailure extends SupervisorState {}

class SupervisorScanCanceled extends SupervisorState {}