import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:green_saudi_app/utils/spacing.dart';

class EventView extends StatelessWidget {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hello")
              .animate()
              .fadeIn(duration: 600.ms)
              .callback(duration: 300.ms, callback: (_) => print('halfway')),
          Text("Horrible Pulsing Text")
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .fadeOut(curve: Curves.easeInOut),
          Text("Before")
              .animate()
              .swap(duration: 900.ms, builder: (_, __) => Text("After")),
          Animate().toggle(
            duration: 2.seconds,
            builder: (_, value, __) => Text(value ? "Before" : "After"),
          ),
          Text("Hello").animate().fade(duration: 500.ms).scale(delay: 500.ms),
           height32,
          Text("Hello World!")
              .animate()
              .fadeIn() // uses `Animate.defaultDuration`
              .scale() // inherits duration from fadeIn
              .move(
                  delay: 300.ms,
                  duration: 600.ms) // runs after the above w/new duration
              , // inherits the delay & duration from move
              height32,
          Text('Hello').animate().tint(color: Colors.purple),
          Text("Hello World").animate().custom(
              duration: 1000.ms,
              builder: (context, value, child) => Container(
                    color: Color.lerp(Colors.red, Colors.blue, value),
                    padding: EdgeInsets.all(8),
                    child: child, // child is the Text widget being animated
                  )),
          height100,
          // an opacity of 1 is "neutral"

          Column(
              children: AnimateList(
            interval: 400.ms,
            effects: [FadeEffect(duration: 300.ms)],
            children: [Text("Hello"), Text("World"), Text("Goodbye")],
          )),

// or shorthand:
          Column(
            children: [Text("Hello"), Text("World"), Text("Goodbye")]
                .animate(interval: 400.ms)
                .fade(duration: 300.ms),
          )
        ],
      )),
    );
  }
}
