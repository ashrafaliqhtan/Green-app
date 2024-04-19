import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_saudi_app/data_layer/data_layer.dart';
import 'package:green_saudi_app/extensions/screen_handler.dart';
import 'package:green_saudi_app/localization/localization.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/Admin/bottom_nav_bar_admin/view/bottom_nav_bar_admin.dart';
import 'package:green_saudi_app/views/Authentication/bloc/auth_bloc.dart';
import 'package:green_saudi_app/views/Authentication/view/login_view.dart';
import 'package:green_saudi_app/views/Drawer/widget/drawer_widget.dart';
import 'package:green_saudi_app/views/profile/view/profile_user.dart';
import 'package:green_saudi_app/views/profile/view/settings_user.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final serviceLocator = DataInjection().locator.get<DBServices>();
    final user = serviceLocator.user;
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLogoutSuccessState) {
            context.getMessagesBar(msg: state.message, color: green);
            context.push(view: const LoginView(), isPush: false);
          } else if (state is AuthLogoutErrorState) {
            context.getMessagesBar(msg: state.message, color: red);
          }
        },
        builder: (context, state) {
          return Container(
            width: context.getWidth() * .7,
            decoration: BoxDecoration(
                color: green,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            padding: const EdgeInsets.only(top: 50, bottom: 70, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(),
                    width16,
                    Text(
                      user.name ?? "مرحبا بك",
                      style: TextStyle(
                        color: pureWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    DrawerItem(
                      icon: Icons.person,
                      title: AppLocale.profile.getString(context),
                      onTap: () {
                        context.push(view: const ProfileUser(), isPush: false);
                      },
                    ),
                    DrawerItem(
                      icon: Icons.info,
                      title: AppLocale.aboutUS.getString(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Divider(
                        color: pureWhite,
                        thickness: 0.2,
                        height: 0.2,
                      ),
                    ),
                    const DrawerItem(
                      icon: Icons.eco,
                      title: 'Sustainability',
                    ),
                    const DrawerItem(
                      icon: Icons.nature,
                      title: 'Nature',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Divider(
                        color: pureWhite,
                        thickness: 0.2,
                        height: 0.2,
                      ),
                    ),
                  ],
                ),
                height20,
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.push(view: const SettingsUser(), isPush: true);
                      },
                      icon: Icon(Icons.settings, color: pureWhite),
                    ),
                    width8,
                    Text(
                      AppLocale.SettingsTitle.getString(context),
                      style: TextStyle(
                          color: pureWhite, fontWeight: FontWeight.bold),
                    ),
                    width8,
                    Container(width: 2, height: 20, color: pureWhite),
                    width8,
                    InkWell(
                      onTap: () {
                        context.read<AuthBloc>().add(LogoutEvent());
                      },
                      child: Text(
                        AppLocale.logoutButton.getString(context),
                        style: TextStyle(
                            color: pureWhite, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    user.typeRole == "admin"
                        ? IconButton(
                            onPressed: () {
                              context.push(
                                  view: BottomNavBarAdmin(), isPush: false);
                            },
                            icon: Icon(
                              Icons.border_color_rounded,
                              color: pureWhite,
                            ),
                          )
                        : const SizedBox(),
                         width8,
                   user.typeRole == "admin"
                        ?  Text(
                      "back to Control Panel",
                      style: TextStyle(
                          color: pureWhite, fontWeight: FontWeight.bold),
                    ): const SizedBox(),
                  ],
                ),
                height20,
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.facebook_outlined,
                          color: pureWhite,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.instagram,
                          color: pureWhite,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.youtube,
                          color: pureWhite,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.twitter,
                          color: pureWhite,
                        )),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
