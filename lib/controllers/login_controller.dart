import 'package:bkey_user/services/user_services.dart';
import 'package:flutter/material.dart';
import '../api_services.dart';
import '../models/signup_model.dart';

class LoginController extends ChangeNotifier {
  final ApiService apiService;

  bool isLoading = false;
  String? errorMessage;

  LoginController({required this.apiService});

  Future<bool> login(SignupRequest request) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final data = await apiService.post('/login', body: request.toJson());
      final response = SignupResponse.fromJson(data);
      await UserStorage.saveUser(response.user, response.fbToken);
      return true;
    } catch (e) {
      if (e is ApiException) {
        errorMessage = e.message;
      } else {
        errorMessage = e.toString();
      }
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
