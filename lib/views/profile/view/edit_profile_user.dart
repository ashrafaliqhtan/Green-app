import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/locators/data_injection.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/localization/localization.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';
import 'package:green_saudi_app/resources/image_picker/bloc/image_pic_bloc.dart';
import 'package:green_saudi_app/service/supabase/supabase_services.dart';
import 'package:green_saudi_app/views/Authentication/bloc/auth_bloc.dart';
import 'package:green_saudi_app/views/Profile/view/profile_user.dart';
import 'package:green_saudi_app/views/Profile/view/settings_user.dart';
import 'package:green_saudi_app/views/Profile/widget/custom_drop_menu.dart';

class EditProfileUser extends StatefulWidget {
  const EditProfileUser({super.key});

  @override
  State<EditProfileUser> createState() => _EditProfileUserState();
}

class _EditProfileUserState extends State<EditProfileUser> {
  TextEditingController nameController = TextEditingController(
      text: DataInjection().locator.get<DBServices>().user.name);
  TextEditingController phoneController = TextEditingController(
      text: DataInjection().locator.get<DBServices>().user.phoneNumber);

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final serviceLocator = DataInjection().locator.get<DBServices>();
    final user = serviceLocator.user;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUpdateProfileState) {
          context.getMessagesBar(msg: state.message, color: green);
          context.read<AuthBloc>().add(LoadProfileEvent());
          context.push(view: const ProfileView(), isPush: false);
        }
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  context.push(view: const SettingsUser(), isPush: true);
                },
                icon: Icon(
                  Icons.arrow_forward,
                  color: pureWhite,
                ),
              ),
            ],
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocale.editTitle.getString(context),
                  style: TextStyle(
                      color: pureWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 32),
                )
              ],
            ),
            backgroundColor: green,
            automaticallyImplyLeading: false,
          ),
          body: Center(
            child: Column(
              children: [
                height20,
                InkWell(
                  onTap: () {
                    context.read<ImagePicBloc>().add(SelectImage());
                  },
                  child: BlocBuilder<ImagePicBloc, ImagePicState>(
                    builder: (context, state) {
                      if (state is ImageState) {
                        return SizedBox(
                            height: 150,
                            width: 150,
                            child: serviceLocator.userImageFile.path != ""
                                ? CircleAvatar(
                                    radius: 100,
                                    backgroundImage:
                                        FileImage(serviceLocator.userImageFile),
                                  )
                                : const CircleAvatar(
                                    radius: 100,
                                    backgroundImage: NetworkImage(
                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png"),
                                  ));
                      } else {
                        return Stack(
                          children: [
                            const CircleAvatar(
                              radius: 100,
                              backgroundImage: NetworkImage(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png"),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 5,
                              child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: green,
                                  ),
                                  child: Center(
                                      child: Icon(
                                    Icons.edit,
                                    color: pureWhite,
                                  ))),
                            )
                          ],
                        );
                      }
                    },
                  ),
                ),
                height10,
                const SizedBox(
                  width: 250,
                  child: DropMenu(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 350,
                    height: 82,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.man_outlined,
                            color: green,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 250,
                                  height: 50,
                                  child: TextField(
                                    controller: nameController,
                                    cursorErrorColor: green,
                                    decoration: InputDecoration(
                                        hintText: AppLocale.userName
                                            .getString(context),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 350,
                    height: 82,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone_android_outlined,
                            color: green,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 250,
                                  height: 50,
                                  child: TextField(
                                    controller: phoneController,
                                    decoration: InputDecoration(
                                        hintText: AppLocale.phoneNumber
                                            .getString(context),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<AuthBloc>().add(UpdateProfileEvent(
                        city: user.city ?? "Riyadh",
                        name: nameController.text,
                        phone: phoneController.text));
                    context.read<ImagePicBloc>().add(UpdateImageToDatabase(
                        "avatar", GetIt.I.get<DBServices>().userID));
                  },
                  child: Container(
                    height: 60,
                    width: 345,
                    decoration: BoxDecoration(
                        color: green, borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text(
                      AppLocale.saveButton.getString(context),
                      style: TextStyle(
                          color: pureWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
