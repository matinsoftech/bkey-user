import 'package:bkey_user/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingController extends ChangeNotifier {
  late OnboardingModel _model;

  OnboardingController({required int totalPages}) {
    _model = OnboardingModel(currentPage: 0, totalPages: totalPages);
  }

  // Getters for direct access to model properties
  OnboardingModel get model => _model;
  int get currentPage => _model.currentPage;
  int get totalPages => _model.totalPages;
  bool get isLastPage => _model.currentPage == _model.totalPages - 1;
  bool get isFirstPage => _model.currentPage == 0;

  void nextPage() {
    if (_model.currentPage < _model.totalPages - 1) {
      _model = _model.copyWith(currentPage: _model.currentPage + 1);
      notifyListeners();
    }
  }

  void previousPage() {
    if (_model.currentPage > 0) {
      _model = _model.copyWith(currentPage: _model.currentPage - 1);
      notifyListeners();
    }
  }

  void skipToLast() {
    _model = _model.copyWith(currentPage: _model.totalPages - 1);
    notifyListeners();
  }

  void setCurrentPage(int index) {
    // Renamed from setPage to match your usage
    if (index >= 0 && index < _model.totalPages) {
      _model = _model.copyWith(currentPage: index);
      notifyListeners();
    }
  }

  void reset() {
    _model = _model.copyWith(currentPage: 0);
    notifyListeners();
  }
}
