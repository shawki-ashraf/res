import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  final PageController pageController = PageController();

  int currentIndex = 0;

  void changePage(int index) {
    currentIndex = index;
    emit(OnboardingPageChanged(index));
  }

  void nextPage() {
    if (currentIndex < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // هنا بعدين navigation
    }
  }
}
