import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:green_saudi_app/model/onboarding_model.dart';
import 'package:meta/meta.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  List<Onboarding> items = [
    Onboarding(
        title: "تشجير المملكة العربية السعودية",
        description:
            "مهمة تسريع رحلة الانتقال الأخضر للمملكة العربية السعودية والحد من تداعيات تغير المناخ."
            "تلتزم المبادرة بإعادة تأهيل 40 مليون هكتار من الأراضي واستعادة المساحات الخضراء الطبيعية في المملكة العربية السعودية.",
        image:
            "assets/images/354624_Saudi green with many trees  _xl-1024-v1-0.png"),
    Onboarding(
        title: "تقليل الانبعاثات الكربونية",
        description:
            "مهمة تسريع رحلة الانتقال الأخضر للمملكة العربية السعودية والحد من تداعيات تغير المناخ.",
        image: "assets/images/emission-target.jpg"),
    Onboarding(
        title: "حماية المناطق البرية والبحرية",
        description:
            "توفير الموائل الطبيعية الضرورية للعديد من الأنواع النباتية والحيوانية، مع ضمان الازدهار المستمر للبشرية دون أي تعارض مع الطبيعة أو التأثير عليها.",
        image: "assets/images/ef57f528-4fd4-409a-8473-ee471d0a4fc9.png"),
  ];
  OnboardingBloc() : super(OnboardingInitial()) {
    on<NextViewEvent>(
      (event, emit) {
        if (state is OnboardingInitial) {
          emit(OnboardingLoadedState(currentIndex: 0));
        } else if (state is OnboardingLoadedState) {
          final currentIndex = (state as OnboardingLoadedState).currentIndex;
          if (currentIndex < items.length - 1) {
            emit(OnboardingLoadedState(currentIndex: currentIndex + 1));
          }
        }
            },
    );
  }
}
