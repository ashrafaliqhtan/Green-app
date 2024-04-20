import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_saudi_app/resources/extensions/screen_handler.dart';
import 'package:green_saudi_app/resources/utils/colors.dart';
import 'package:green_saudi_app/views/Admin/view/bloc/event_bloc.dart';

class RewordContainer extends StatelessWidget {
  const RewordContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventBloc()..add(EventLoadEvent()),
      child: BlocConsumer<EventBloc, EventState>(
        listener: (context, state) {
          if (state is EventErrorState) {
            context.getMessages(msg: state.msg, color: red);
          }
        },
        builder: (context, state) {
          if (state is EventLoadingState) {
            return CircularProgressIndicator(); //shimmerEffect();
          }
          if (state is EventLoadedState) {
            if (state.list.isNotEmpty) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 140,
                    width: 125,
                    decoration: BoxDecoration(
                        color: index.isEven ? white : white,
                        borderRadius: BorderRadius.circular(8)),
                    margin: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Text('${state.list[index].title}'),
                  );
                },
              );
            }
          }
          return SizedBox(
            height: context.getHeight() * 0.5,
          );
        },
      ),
    );
  }
}
