// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/localization/localization.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/resources/utils/spacing.dart';
import 'package:green_saudi_app/service/database_configuration.dart';
import 'package:green_saudi_app/views/Admin/bottom_nav_bar_admin/view/bottom_nav_bar_admin.dart';
import 'package:green_saudi_app/views/Admin/view/add_event.dart';
import 'package:green_saudi_app/views/Admin/bloc/event_bloc.dart';

class EventsAdminPage extends StatelessWidget {
  const EventsAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventBloc()..add(EventLoadEvent(order: true)),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                context.push(view: const BottomNavBarAdmin(), isPush: false);
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ],
          backgroundColor: green,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppLocale.eventsAdmin.getString(context),
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        body: SizedBox(
          height: context.getHeight(),
          child: BlocBuilder<EventBloc, EventState>(
            builder: (context, state) {
              if (state is EventLoadingState) {
                return Center(
                    child: CircularProgressIndicator(
                  color: green,
                ));
              } else if (state is EventLoadedState) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(14)),
                        height: 100,
                        width: context.getWidth(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/adminlogo.png"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: FutureBuilder(
                                future: translatorFunction(
                                  state.list[index].title ?? "No Content",
                                ),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const SizedBox();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    return SizedBox(
                                      width: context.getWidth() *.70,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          snapshot.data.toString(),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/Insert block-rafiki.svg",
                        width: 200,
                        height: 200,
                      ),
                      height16,
                      Text(
                        AppLocale.noEvent.getString(context),
                        style: TextStyle(fontSize: 30, color: green),
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push(view: const AddEvent(), isPush: false);
          },
          backgroundColor: green,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
