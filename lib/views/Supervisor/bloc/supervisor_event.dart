part of 'supervisor_bloc.dart';

@immutable
sealed class SupervisorEvent {}

class ScanQR extends SupervisorEvent {}

class LoadSupervisors extends SupervisorEvent{}