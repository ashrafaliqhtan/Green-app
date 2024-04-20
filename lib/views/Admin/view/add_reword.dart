import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/locators/data_injection.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/image_picker/bloc/image_pic_bloc.dart';
import 'package:green_saudi_app/resources/localization/localization.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:green_saudi_app/views/Admin/view/rewards_admin_page.dart';
import 'package:green_saudi_app/views/Admin/widgets/name_of_row.dart';
import 'package:green_saudi_app/views/Admin/widgets/textfiled_container.dart';

class AddReword extends StatelessWidget {
  const AddReword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController rewordNameController = TextEditingController();
    TextEditingController rewordDescriptionController = TextEditingController();
    TextEditingController companyNameController = TextEditingController();
    final serviceLocator = DataInjection().locator.get<DBServices>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: pureWhite),
        backgroundColor: green,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppLocale.addReword.getString(context),
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // First row
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(AppLocale.addImageEvent.getString(context),
                      style: const TextStyle(
                        fontSize: 24,
                      )),
                  const Spacer(),
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
                            child: serviceLocator.ImageFileFromDatabase.path !=
                                    ""
                                ? Container(
                                    child: Center(
                                      child: Image.file(
                                          serviceLocator.ImageFileFromDatabase),
                                    ),
                                  )
                                : Container(
                                    child: Center(
                                      child: Image.network(
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png"),
                                    ),
                                  ),
                          );
                        } else {
                          return Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png"),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            NameRow(
              rowName: AppLocale.companyName.getString(context),
            ),
            height16,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextfieldContainer(
                hintText: "",
                controller: companyNameController,
                keyboardType: TextInputType.text,
              ),
            ),
            NameRow(
              rowName: AppLocale.rewordName.getString(context),
            ),
            height16,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextfieldContainer(
                hintText: "",
                controller: rewordNameController,
                keyboardType: TextInputType.text,
              ),
            ),
            height26,
            NameRow(
              rowName: AppLocale.addDescription.getString(context),
            ),
            height16,
            Container(
              width: 350,
              height: 180,
              decoration: BoxDecoration(
                  border: Border.all(color: black),
                  color: pureWhite,
                  borderRadius: BorderRadius.circular(40)),
              child: TextField(
                controller: rewordDescriptionController,
                style: TextStyle(color: black),
                maxLines: 5,
                maxLength: 250,
                decoration: const InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            height26,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 175,
                  height: 60,
                  decoration: BoxDecoration(
                      color: green, borderRadius: BorderRadius.circular(30)),
                  child: TextButton(
                    onPressed: () {
                      context.push(view: const RewardsAdminPage(), isPush: false);
                    },
                    child: Text(
                      AppLocale.cancel.getString(context),
                      style: TextStyle(
                          color: pureWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 34),
                    ),
                  ),
                ),
                Container(
                  width: 175,
                  height: 60,
                  decoration: BoxDecoration(
                      color: green, borderRadius: BorderRadius.circular(30)),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppLocale.addIt.getString(context),
                      style: TextStyle(
                          color: pureWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 34),
                    ),
                  ),
                ),
              ],
            ),
            height16,
          ],
        ),
      ),
    );
  }
}
