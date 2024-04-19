import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/data_layer/data_layer.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/localization/localization.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/Authentication/bloc/auth_bloc.dart';
import 'package:green_saudi_app/views/Hours%20History/view/Hours_history.dart';
import 'package:green_saudi_app/views/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:green_saudi_app/views/profile/view/settings_user.dart';
import 'package:green_saudi_app/views/profile/widget/text_profile.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(LoadProfileEvent());
    final serviceLocator = DataInjection().locator.get<DBServices>();
    final user = serviceLocator.user;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.push(view:const BottomNavBar(), isPush: false);
            },
            icon: Icon(
              Icons.arrow_back,
              color: pureWhite,
            )),
        actions: [
          Text(
            AppLocale.account.getString(context),
            style: TextStyle(color: pureWhite, fontSize: 25),
          )
        ],
        backgroundColor: green,
        automaticallyImplyLeading: true,
        title: IconButton(
            onPressed: () {
              context.push(view: const SettingsUser(), isPush: true);
            },
            icon: Icon(
              Icons.settings,
              color: pureWhite,
            )),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AuthLoadProfileState) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 125,
                    width: 125,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: CachedNetworkImage(
                          imageUrl:serviceLocator.userImageUrl ??
                              "https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg",
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  Text(state.user.name ?? "Name"),
                  InkWell(
                    onTap: () {
                      context.push(view: HoursHistoryView(), isPush: false);
                    },
                    child: TextProfile(
                      title: AppLocale.volunteerHours.getString(context),
                      data: "ساعة${user.volunteerHours ?? "0"}",
                      icon: Icons.arrow_back_ios_new,
                    ),
                  ),
                  TextProfile(
                    title: AppLocale.email.getString(context),
                    //TODO : fix this
                    data: "",
                    // data: serviceLocator.email,
                  ),
                  TextProfile(
                    title: AppLocale.city.getString(context),
                    data: state.user.city ?? "الرياض",
                  ),
                  TextProfile(
                    title: AppLocale.phoneNumber.getString(context),
                    data: state.user.phoneNumber ?? "0500500505",
                  ),
                  height26,
                  QrImageView(
                    data: serviceLocator.userID,
                    size: 200,
                  ),
                ],
              ),
            );
          } else {
            //TODO: filed to display Prfile
            return Text("Error: Profile");
          }
        },
      ),
    );
  }
}
