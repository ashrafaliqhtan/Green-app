import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/localization/localization.dart';
import 'package:green_saudi_app/utils/colors.dart';
import 'package:green_saudi_app/utils/spacing.dart';
import 'package:green_saudi_app/views/profile/bloc/image_pic_bloc.dart';
import 'package:green_saudi_app/views/profile/widget/custom_drop_menu.dart';

class EditProfileUser extends StatelessWidget {
  const EditProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return BlocProvider(
      create: (context) => ImagePicBloc(),
      child: Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        appBar: AppBar(
          actions:  [Text( AppLocale.editTitle.getString(context),style: TextStyle(color: pureWhite, fontSize: 25),)],
          backgroundColor: green,
          automaticallyImplyLeading: true,
        ),
        body: Center(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  BlocProvider.of<ImagePicBloc>(context).add(SelectImage());
                },
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: BlocBuilder<ImagePicBloc, ImagePicState>(
                    builder: (context, state) {
                      if (state is ImageState) {
                        return CircleAvatar(
                            radius: 100,
                            backgroundImage: FileImage(state.fileImage1));
                      } else {
                        return Image.network(
                            "https://image.movieglu.com/7772/GBR_007772h0.jpg");
                      }
                    },
                  ),
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
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.man_outlined,
                          color: green,
                          shadows: [Shadow(color: black, blurRadius: 10)],
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
                                    decoration:  InputDecoration(
                                      hintText:  AppLocale.userName.getString(context),
                                    )),
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
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.man_outlined,
                          color: green,
                          shadows: [Shadow(color: black, blurRadius: 10)],
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
                                    decoration:  InputDecoration(
                                      hintText:  AppLocale.phoneNumber.getString(context),
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: green,
                child: const Text("حفظ"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
