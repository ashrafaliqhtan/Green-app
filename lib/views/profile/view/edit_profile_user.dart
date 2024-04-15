import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    textDirectionToAxisDirection(TextDirection.rtl);
    return BlocProvider(
      create: (context) => ImagePicBloc(),
      child: Scaffold(
        backgroundColor: greyLight,
        appBar: AppBar(
          actions:  [Text("تعديل البيانات",style: TextStyle(color: pureWhite, fontSize: 25),)],
          backgroundColor: green,
          automaticallyImplyLeading: true,
        ),
        body: Center(
          child: Column(
            textDirection: TextDirection.rtl,
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
                      color: pureWhite,
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(
                          Icons.man_outlined,
                          color: green,
                          shadows: [Shadow(color: black, blurRadius: 10)],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            textDirection: TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 250,
                                height: 50,
                                child: TextField(
                                    textDirection: TextDirection.rtl,
                                    controller: nameController,
                                    decoration: const InputDecoration(
                                      hintText: "اسم المستخدم",
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
                      color: pureWhite,
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(
                          Icons.man_outlined,
                          color: green,
                          shadows: [Shadow(color: black, blurRadius: 10)],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            textDirection: TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 250,
                                height: 50,
                                child: TextField(
                                    textDirection: TextDirection.rtl,
                                    controller: phoneController,
                                    decoration: const InputDecoration(
                                      hintText: "رقم الجوال",
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
