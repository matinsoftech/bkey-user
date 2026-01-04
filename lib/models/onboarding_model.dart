class OnboardingModel {
  final int currentPage;
  final int totalPages;

  const OnboardingModel({required this.currentPage, required this.totalPages});

  bool get isLastPage => currentPage == totalPages - 1;

  OnboardingModel copyWith({int? currentPage}) {
    return OnboardingModel(currentPage: currentPage ?? this.currentPage, totalPages: totalPages);
  }
}
