import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:green_saudi_app/locators/data_injection.dart';
import 'package:green_saudi_app/model/reward_model.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/image_picker/bloc/image_pic_bloc.dart';
import 'package:green_saudi_app/resources/localization/localization.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:green_saudi_app/views/Admin/bottom_nav_bar_admin/view/bottom_nav_bar_admin.dart';
import 'package:green_saudi_app/views/Admin/bloc/reward_bloc.dart';
import 'package:green_saudi_app/views/Admin/view/rewards_admin_page.dart';
import 'package:green_saudi_app/views/Admin/widgets/name_of_row.dart';
import 'package:green_saudi_app/views/Admin/widgets/textfiled_container.dart';
import 'package:uuid/uuid.dart';

class AddReword extends StatefulWidget {
  const AddReword({super.key});

  @override
  State<AddReword> createState() => _AddRewordState();
}

class _AddRewordState extends State<AddReword> {
  TextEditingController rewordNameController = TextEditingController();
  TextEditingController rewordDescriptionController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  @override
  void dispose() {
    rewordNameController.dispose();
    rewordDescriptionController.dispose();
    companyNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final serviceLocator = DataInjection().locator.get<DBServices>();
    String imageId = const Uuid().v4();
    String rewardCompanyLogoUrl = "";
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
        body: BlocListener<RewardBloc, RewardState>(
          listener: (context, state) {
            if (state is RewardSuccessState) {
              context.getMessagesBar(msg: state.msg, color: green);
              context.push(view: const BottomNavBarAdmin(), isPush: false);
            } else if (state is RewardErrorState) {
              context.getMessagesBar(
                  msg: state.msg, color: red, success: false);
            }
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
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
                                  child: SizedBox(
                                      height: 150,
                                      width: 150,
                                      child: Center(
                                        child: Image.file(serviceLocator
                                            .ImageFileFromDatabase),
                                      )));
                            } else {
                              return Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 100,
                                ),
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
                      color: Theme.of(context).primaryColor,
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
                          color: green,
                          borderRadius: BorderRadius.circular(30)),
                      child: TextButton(
                        onPressed: () {
                          context.push(
                              view: const RewardsAdminPage(), isPush: false);
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
                          color: green,
                          borderRadius: BorderRadius.circular(30)),
                      child: TextButton(
                        onPressed: () async {
                          if (serviceLocator
                              .ImageFileFromDatabase.path.isNotEmpty) {
                            context.read<ImagePicBloc>().add(
                                UpdateImageToDatabase(
                                    "reward_poster", imageId));
                            rewardCompanyLogoUrl = await serviceLocator
                                .urlImage("reward_poster", imageId);
                          }
                          RewardModel reward = RewardModel(
                              rewardCompanyLogo: rewardCompanyLogoUrl,
                              rewardCompanyName: companyNameController.text,
                              rewardName: rewordNameController.text,
                              rewardContent: rewordDescriptionController.text,
                              rewardId: imageId);
                          // ignore: use_build_context_synchronously
                          context
                              .read<RewardBloc>()
                              .add(RewardAdded(reward: reward));
                        },
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
        ),
      ),
    );
  }
}
