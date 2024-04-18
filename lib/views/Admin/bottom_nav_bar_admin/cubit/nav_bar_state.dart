part of 'nav_bar_cubit.dart';

@immutable
sealed class NavBarAdminState {}

final class NavBarAdminInitial extends NavBarAdminState {}

class SuccessChangeIndex extends NavBarAdminState{}
