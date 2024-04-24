import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/views/Admin/bloc/event_bloc.dart';

class RegionsWidget extends StatelessWidget {
  const RegionsWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<EventBloc>().add(EventRegionEvent(order: true, search: text));
      },
      child: Container(
        width: 95,
        height: 35,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration:
            BoxDecoration(color: green, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: pureWhite),
          ),
        ),
      ),
    );
  }
}
