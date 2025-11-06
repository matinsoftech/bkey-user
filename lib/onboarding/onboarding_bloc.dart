import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final int totalPages = 3;

  OnboardingBloc() : super(OnboardingState(currentPage: 0, isLastPage: false)) {
    on<NextPageEvent>((event, emit) {
      final nextPage = state.currentPage + 1;
      emit(state.copyWith(currentPage: nextPage, isLastPage: nextPage == totalPages - 1));
    });

    on<PreviousPageEvent>((event, emit) {
      final prevPage = state.currentPage - 1;
      emit(state.copyWith(currentPage: prevPage, isLastPage: prevPage == totalPages - 1));
    });

    on<SkipEvent>((event, emit) {
      emit(state.copyWith(currentPage: totalPages - 1, isLastPage: true));
    });
  }
}
